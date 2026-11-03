Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF83606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W2EdvcCx;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfuvBzZW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jf6cYtdG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7upwgKb79Qwzvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=; b=W2EdvcCxfsmJw1
	5vyuB7uRDzsVWeS/wa5alQ20LE8jrlS89p4rdXzxC/pkXptL5vBVP03lpguMF36pb9c3iLO2/g4Uc
	zwaSUIwm15EU9BO2fePvFU6Tsbk1cK9t059IiyoVngWuy8N7+bT/Yfyq6MGzphMpu5WLlZ4J9j0ow
	5tSIRfkOMHIzuleF1JX/Xq1uW8B7WCTvKNcLjfWVeT7GnlEYWFv6Je9tiBxgPPJxFqa/kklsYvbME
	LTHOeXNaBFSEbSVyRS6z4TgwZe0dxEr4ujTimlQchMrNvR+fj8pQ8QUO4umSOfv+Zn3yF+qzXPZjQ
	3rOWrvwi1ZJ9WZ/RG8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6SY-000000015iu-0gLX;
	Tue, 03 Nov 2026 04:49:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6SN-000000015W0-2n27
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:49:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32C7HX2106925
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 04:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7upwgKb79Qw
	zvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=; b=JfuvBzZWpOyroViKIwsL2V0fmIh
	acu0P2X29m1aWJ4Jn4qNnJ7CFIPHDvjKOYdDArJ/CUZ/N6E5m7SmANdcPtuqAEhl
	ISz2zgn2Zw7NlCkwQs99Nz44gIs5RsqyB0tSuU3Os+qpBdYF13XqyP0JtA5UR0ag
	KGf/IbuMnS687UXoGnKzrvp3fk9q1w83KUIr2i2mt+mKMw7ZrZQevV3h7UzgAIOR
	l3V1NZDP7LjGGCgdUfmAHlhhsxi8UGitR6COavU2yF3t674+GqOLSy5NUbcNVgGy
	6Tf7MsaxyO2Dy+9czyal4Eyz8gk2YO6zO7X8IFq6qJcemN+BnmZkPexn6oQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m98fqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 04:49:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so691655985a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793681350; x=1794286150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7upwgKb79Qwzvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=;
        b=jf6cYtdG6JmP1JjZ0Qf71U5uDB2prumClgXjHGGHxzYFEeDESSvHlcxwA3jLuL4DiW
         1px6uhkjZ44z/miqHwMnkDW6WjHj3yODFyXmOOHCMo4f1bdU4eRpdBgym56xJ/UOQyfv
         lYko97V2zhO0UbkKMYjDdXcEqxB75unqfpDPI03CCHgFJRdR2KQfQY0BbZqPHiyQTQHz
         dD0QP1N++sVY6lY5QrCNPidgJcBtoR7kENdCYB3aaE+9PL2CzxyvCtTqe8la3HQBojEA
         sKH71RgrVYTVGeN80DvFu3QI3X+wplDMLGfiZ4Z/l7riJaJor33eDLqdgiXaMHC1Zj1z
         Xwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681350; x=1794286150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7upwgKb79Qwzvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=;
        b=JWc6erHECNqdc6eA9HzoAxXBxNWXxpkg3EMy7wpYdRyFCDzZnm7vQt6xvNecaa681r
         8RdE3j0PNgQXiLnAJApZlq+gBVYyUvoWfisdXU/MDvSG0K9X7zz3vtOZAx5GWJhHS+Rj
         HRU9G27Z5LKgFBPTfZ6Iu3Wrg8/HM5Vot8u3NgXo8jUwc6SdhtyVAcR2KFkY8WMw9q0L
         18zcXAILmLb7H9IlvRIkaMm/7+zy2t4+6VucuYUkJW01m99cNk9VzoUmf4M4gS8TKacd
         nc0N7hcMdwwC7jI6AL4WQt0R/MkcyqW/pM3nhYp8daios+zl/BC6BEoNsF6n4tZchM1h
         ZfKA==
X-Forwarded-Encrypted: i=1; AKwUvBy+CWgSG3kU5Hzz8Tb8yfOabr9q3MDt9zjQZAac3f43bDer32XLYuo7B4+nrIRPY75I//5bOsxsZpCptFunwEeT@lists.infradead.org
X-Gm-Message-State: APuU4Z+985bj/MZpKTxokNiBakn+dESrYMDnqhyzxRog8SYVHBGuG6Qu
	11tT0aBtF2CLag5yM+xFZd7I/fM8JvzUwHLUlFoi1dnslM3Q0NH+f3AtUwI7Z7unyGKVy+I9N8H
	WgsyskFJr0Tf88Bx3Ce6tJGZMP5j7DBtwFGnTJ4BxRGtAbk8Q3FjtYmSqPSl1DhzTMEYdN1iKJB
	iK6g==
X-Gm-Gg: AYBFou3i7c5ryOA+qgrQaSMnMVdIkYY37rYmL5bLxlnuIygQU83dJU74xlw4vFwr27o
	1o+YvCta+yddTi2bCSRuuBTQW74LmkeonrPiVozDrIKu8w6tl4WookmUv8uCftNslMYIDN/m9oF
	LXvLTXKTDCQ5kV6o49A1pp9W4FoBL17qgo6yq8m+nV6grbtFnj4SwV57f+Ie0kuHIs9hYGyXYNx
	BRdNnMoVW2yryHyXDdHaxhrpyEfZ3onQCXtnHX8UD/Yj9TIRsBwn8NkrWejG21uKUKCHoSkHw0s
	FUqMUgb9mM29qI1coMamRLaokVPCiAutAh5XS5aFaSU5X45myyfhjoeaWdEOK9WkQNP9dHL3lPg
	7AkqaZ2TUwIZxLtufHzocGPCpnMLLmk6jkyMoNh9awzpZ+T9sFonNNxkKKPmLrMUCY/Si3oy9DD
	7x
X-Received: by 2002:a05:620a:6844:b0:93e:c12c:4400 with SMTP id af79cd13be357-9442172bcecmr1859912885a.77.1793681349889;
        Mon, 02 Nov 2026 20:49:09 -0800 (PST)
X-Received: by 2002:a05:620a:6844:b0:93e:c12c:4400 with SMTP id af79cd13be357-9442172bcecmr1859911485a.77.1793681349430;
        Mon, 02 Nov 2026 20:49:09 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm25685445e9.4.2026.11.02.20.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:49:08 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 5/6] powercap: dtpm: Rename Rockchip virtual node descriptor
Date: Tue,  3 Nov 2026 05:48:19 +0100
Message-ID: <d58bc47b95fad310cb506ca01b59cbc54f0d8c75.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7GTG8CVWwbsEUEmzONQ0IU_v90_0ttJ-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX9X4fv5vgY2o+
 eKonIUDVAEHQLrO3c+xqhHmI1JLvSPjlUcQ/Kozl80ymHcNFo35QMHKyz4CUnx00++7ZgUQr1Pf
 7eIbxDVgGPEild0zO1LYt8RbofSZ5bs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfXzUkUl8CJZvMA
 xxsQ/17dv/VuDB/OV7gMRb1p56pdtXn3X0sU9+GZN3B4HoeMxh0nD2EsMsWAs6CopXjJ4KR7CKJ
 MMLnktYFLx0IJPCk17p+lSnLJQi5qDKQctj4DC5tjD5p0wB6Lct8XuRsQ4wMttsO9aYZeuSSVxm
 J5PFcaiw8iEDFFswgCUkm0Sukbajz64nmH2bXwkQxE80xAoQX+cSe19EcpYa5DqNtZ4rk0W/hK7
 apBpQqmE5J8nzKiwSYr2aZFMb3OUIeGtpCbcDh6w6sFRJOtuaIc0nlWfCFdqyROXcS/Y+XOqvkH
 6Yw84ghf+g17n2EmJS9XzTIehVcKb/rhdk6RDnyOg1VYqonsSjF5RzISbOvMU4K1dnfwL+cXKdM
 2Uw5K/NAN71Zm9EUg/wE8ZI00aEXPv9HToDqACQR9kAMhVPwK27hde+DhgefACAkbvedyvPV/cs
 7n8DQLWLyOJvRKCfM/w==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae967c6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=_NZqlvP9bvTAGtRSC3sA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 7GTG8CVWwbsEUEmzONQ0IU_v90_0ttJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204911_872385_8FB0AC02 
X-CRM114-Status: GOOD (  18.95  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The virtual DTPM node descriptor is named after the RK3399 even though
it does not contain any SoC-specific information.

Rename it to rockchip_virtual so it can be reused by other Rockchip SoC
hierarchies.

No functional change intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---
Changes in v5 (since v4):
- Add Reviewed-by from Lukasz Luba; no code changes.

Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7 and refresh context after patch 4 style cleanup.
- No functional changes.

 drivers/soc/rockchip/dtpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index 222d9098cc98..5ae00680602f 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -11,7 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
-static struct dtpm_node rk3399_virtual = {
+static struct dtpm_node rockchip_virtual = {
 	.type = DTPM_NODE_VIRTUAL,
 };
 
@@ -33,12 +33,12 @@ static struct dtpm_node rk3399_gpu = {
 static struct powercap_node rk3399_nodes[] __initdata = {
 	[0] = {
 		.name = "rk3399",
-		.data = &rk3399_virtual,
+		.data = &rockchip_virtual,
 	},
 	[1] = {
 		.name = "package",
 		.parent = &rk3399_nodes[0],
-		.data = &rk3399_virtual,
+		.data = &rockchip_virtual,
 	},
 	[2] = {
 		.name = "cpu0-cpufreq",
-- 
2.43.0


