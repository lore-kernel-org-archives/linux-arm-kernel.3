Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5490606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BfHPiPDt;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5B4EY4m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJ5rqiJt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ytOjkYgyk5LlmjFcxh3gPQQdewa7HVP6wQzba4/f+go=; b=BfHPiPDtImuJOA
	UidyHlfY7Skae6lJl5sRgyUIsGpNzZGFJjAlSv22oahO0hInU+ik+U139t5nTVDBWQoQR05qo5Pmr
	y0nJiEW7twQrEXY3j/fPBklK+BvN9irBr4+rOyHf+OjC5y08f3/2IA4p1c15krDMACZ8CdDIAWXrV
	DG/9F0p5ak8ZzZhoqzBOAQRAfxnYlxh6+VuW8cfTyyKk/vY3yjPIINDOblnvlSNPCsI6k9pHzqPWH
	YHB8AhSSCQTG5aD2tuhzJLSxUax6uGyCiLYRUZnYIlJ9JAK4MjXx0+G6f0LP0IGMRIZI/lSIzsaV1
	wyVjRnEHFNypogvmgH+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTRl-00000009tX6-14xd;
	Thu, 29 Oct 2026 16:57:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTRf-00000009tOW-1lTr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:57:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGCx3o1619568
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ytOjkYgyk5L
	lmjFcxh3gPQQdewa7HVP6wQzba4/f+go=; b=K5B4EY4m88mryxZuLbPk7QKXc2F
	+bohx0GPOVwzeoz05M1vtTbY1G/RlSkU0t0d7BmUFdl2FGHmh2zw94EKW3kqyiDU
	M5Q2hQmVUQNKONVnE/q/FqJlsBAdZV2c41/yn58cj0e8XrAwdRE9xBEiJGQmlAcC
	tPP9kVwj2n9rHIP8EuVxpXWvwoe3+PQRhvUWLXI5dL2r8AvwXfC6DI3QV701Kbyf
	Ua7vj1nxum6/ahaYKeBgVjsOzDzlUuecvKAE7aZveMgc0xLOPOhAbFFCJnXLSGsQ
	W9ZG36XnnqtUdzHoyPbA/nPz9LykFPBypu0zpOFzWWKkf03ZSTXkO6WbGtg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44q9nuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:57:42 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99089f9591aso409803241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793293062; x=1793897862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytOjkYgyk5LlmjFcxh3gPQQdewa7HVP6wQzba4/f+go=;
        b=HJ5rqiJtJPZc+nFSwdka6mgKU8MjQe8e8fsC1HRZmdj0vhjfqtQmd3UfDBeqv4RC33
         e3zD0OeFgNpXhemHwKNcNYEruR4zNftk+lNHGhUmUjdjW3km9aJXQo14roC2QYrH81jG
         +YwG4DFmHSfOI0dtCu6v8j0zdvRe2bpa7WQc/hoGdeT+6tEh3EnS+LV0UjgY68TBcjH7
         676XN7vPf2w5RQLXeCH1zVudBn4pIp+ZGwaNqI8aUT+CGmaHbeuxZE6w+GcXcL98T0Ma
         dexUdwyxZqLlOsMMVjKGpcw3aS5gEM5DaxTJiuDCvUyPpsNPSybTzbbAIa4h5qnYBDGs
         SW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293062; x=1793897862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytOjkYgyk5LlmjFcxh3gPQQdewa7HVP6wQzba4/f+go=;
        b=K34mIauBhwSou/7O+T8n+lCUSgw6l/5wKpTASS8tBVtYD6BPAVFSQOpUosENBZD6gM
         TXIaCBTV9euy0iEDhA/ngjOh+77J2oADgP+sF6aL7KgANCcb5dyGX8A8sCotma+ToqSn
         NHiiBZjQv0mecuWpMish1I0XKIj9lJjE+ppbRu1fK1GCqUQHw0HmbzduqDyBTAqh0sXf
         VfJCFXkOZ9/JQ/SdzwuBIazT0Fm0S6Ue+T4s8N+IslgGaRLqiya/P7TaW1SQpsWrDrlw
         bgvcPsh55cwKEta1cCsd9ZtGoUlbj3EXbOwt49GJZGp1kpkn7CFO/g/Rb/tCmRi9dx1l
         h/fg==
X-Forwarded-Encrypted: i=1; AKwUvBxNNAJrdnF9GkQuy9Cac4ttIIXuwaa0g1ferIbOsJvR2wvsW7+ZbeOPIoiZ0LoWpbPvgociqC5+u5iPCma8UJNm@lists.infradead.org
X-Gm-Message-State: AFq9FYKIly4TD0vR9fVeFe2MejCbVse06Aun9Sj4DTKmNFXdl/Xt1N5n
	p/20iSkknfSPda2B0iwM0G5TzpLKCpG5YgHXfZP92kj9El4el4qdUgOPoCoJYENODVawT9nmdU1
	B9YfTrm4Xp9NFi0+UL66qmZstAn2fU4fMYKeZIbJZMGfwkH44z6HkS2WeUShG2U5oUTVABZEnIs
	csjQ==
X-Gm-Gg: AYBFou1IxfCE+i5SKiy1kDLs/xlPr78mfw3its2tgdHWRaZ84GJ7KW2JV9kerzxcdj4
	BljDr8nfRbnAqsbbmxx2dALEZ6WIWSnMRHiqADVrzrnBlk6YOyiCdVd9wlSyIlWnn6JU8zGUtHj
	B3YQ6KDEi3VOENIKDLcyVGWjET3+fRpHFxUHG0QzRoP7aWu4+X3eY+faLRN3k1E9KDGFDPGEgzn
	9/ECdSM+K48+Rpl5AnKEb8QsGzhqOHTN5qT+AUpHsD3JazH8jzt/4yJ8Wke7yg3E606QZf7t7pi
	RTiUNIiMU9R3V33FfqVz17ybWXHOOJ8F7VBQNgYzcNy53aS3yo5UHVQDOsUO0umwRZ77ItsQsWs
	rrGC4VB7KPaUUlHkAZa0+4zPGVOTuUn2M4/3Bj1fjJ/TiFkzPEwx6hDsy6Xw3m4/whcaqU65Prf
	8D
X-Received: by 2002:a05:6102:6a8c:b0:7cc:2c29:54ef with SMTP id ada2fe7eead31-7d03a5abb96mr2605296137.19.1793293061909;
        Thu, 29 Oct 2026 09:57:41 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8c:b0:7cc:2c29:54ef with SMTP id ada2fe7eead31-7d03a5abb96mr2605280137.19.1793293061411;
        Thu, 29 Oct 2026 09:57:41 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df961dasm325669f8f.23.2026.10.29.09.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:39 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 5/6] powercap: dtpm: Rename Rockchip virtual node descriptor
Date: Thu, 29 Oct 2026 17:56:49 +0100
Message-ID: <063f0587a6c951ca57e941ebab39617a0d0a305c.1793288783.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX4cL06kc4VG8j
 56T8mvHXG2TxAzj4n4OqA6w4WdQfhbQlH5Rlje1qeb+lVGQ+qexjCiYj8s4zYj8jr13Rly01OhU
 QSIO8Maj6L5IALTBaTz2qG51gXBpPhA=
X-Proofpoint-ORIG-GUID: 9o77tkTdN64I2JnKvpb-jpH4wihiQtxc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX1XnuUkAm+qGO
 r8TKzCMCbPBfbuueT49TZap5UwzzLAFSM8jAkUoE14fUQiEEFwosRqduK8DNVY619BJS3g03VoS
 3n2ZAQAmIoPJ8gxB4vC40XnDpPmFZuqcFS8yw5MRU9BI3a7qYkKXXu8xvyyjnmXGkCxAnTKOR4V
 8WLNoRWOuirNXdVC9+6rV7tLtl/fDiXBPyxTJBO1b5EvbdlW8Akh4r+EWPCWc80Dr5eI6ysIRQD
 qqKX2xYZWWiKrP4pB4kpLBB0EkBKRGJlrotwrC2/Ml5eGdjWuM7Pk2UR2L3Wl6D1S0N9zZwZrXT
 A+8kv0hkVk9iGrQXAwXPbRyYSP/NW4A8Rtd6Dhln4JV6GQ+JEn8q1OkYMS18DTvVkH8ht+VcmO4
 laAqMWv+DLBZkL3udBOgg9sQNQrNyxmUve64vnUhZKwUg84/fWODUz3hKsCqTZl94jQIXUPLs2Z
 8VVyz8UE0hAumtyYX/A==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae37b07 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=_NZqlvP9bvTAGtRSC3sA:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 9o77tkTdN64I2JnKvpb-jpH4wihiQtxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095743_485863_FB2A83FF 
X-CRM114-Status: GOOD (  18.22  )
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
---
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


