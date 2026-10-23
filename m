Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1543606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BZsvyhFn;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFfEZkKz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hfbxaKgT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=; b=BZsvyhFn9IoEV1q+Ui1i9oGopH
	bZGXjRtEqDkHGA5J3NaRT/pPX+cOy7JYNRcwA0Xl2+ClEpD15zT18JQy0x+jJIhBm3rU6/K02xo02
	o2rdYhX0Tc2FZp+eAbmCgT7SBDNQnqCRFkgCzePtCRisuk07cl4SNWv1zMMFudhX+YxtSXb0Dd1zX
	3VhBKa/QZ2hM4+RtlqZvmjvgC2BTnoqpVa5lM2vs3q0WPrg2Dn8xVQ2ZJnejDg9QmSpnUSDGkvf+4
	9Docsq/KQ6jtM4hYipS0t7wDnTshDyMQFeP+g2xx/jsjoqm5Vpy/Z7dai3pl2EjZrS/3w2PyFqhQf
	oqrvKwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9DV-0000000Ff5N-1wkV;
	Fri, 23 Oct 2026 06:57:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9DR-0000000Ff4X-1Hx7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:57:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F3Yi1869061
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DcoXlWRKjuA3ss6Tbgxr6QeV
	j4UArC2GCkRmhAMcuic=; b=cFfEZkKzP1uu2iyYQz7OI9qk4OXKzTsnaPoHyKaD
	JP1XeIGyQlTOtvR+y9SP+eL1MRCnTFUcTi9/gFVo0/mnlIhCuRHmC0aNod/Tk3LF
	YpvsVF3lD5MZUKL7pNMmlyAv0j5Dle3n1PyKGSsJ7BjcjcWoaII/dQuFJC9sO0tD
	GbAyeJdvrpHVMK/slqbhA5ng0ope0skxgIHXH9hpogKheQLEw1C8QWi5N4sofmV+
	BC5CahCfZs304bu9gFujPQ9176ooSoC7dC2CzycMLoYe4GYbnA9/t+ppfg2zkf60
	FNqSzJockmnr7VyZkdy8gAby+MBs/pwyGkI9RYL+6Z0fQg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjacpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:57:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac6971ab44so156338a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738643; x=1793343443; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=;
        b=hfbxaKgTw+w3WI37AmL0v3b/SN9ksESlwrEyH2IkqgwEXtX+BeGrjezOSji2gyvgKU
         lfrmjzjkOImbU29OcbP83qQtR68PRxt8K3n0D11Qp91+dRV5w2vFdT9jpjqkS7v3hUBK
         bEPHsyMtWpehgMXyVSXsbGJ3GHt0VINZ+3HIz5a0DkRew9UgCG8lWv2umC24IuvI4YDx
         qJYODhNwF6//EAQ/JDzVqfV79ThyO3+z59pOZCejsZZy98N4+snXQqbbCPdbGc0ptW12
         z5W62FhtrTu4koND6qevBLXhikapV9zdZF0MMl0Y9J4Rcip70CkU8ZbI5OkM+aY6lCAO
         Wzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738643; x=1793343443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcoXlWRKjuA3ss6Tbgxr6QeVj4UArC2GCkRmhAMcuic=;
        b=FAXV5b3Fdo4QLSUPLD2QpUBX0xF2ACiAxtq1je1MBEWpsS6ITlc7v+IhvglZhlAipG
         LSFVRKlKEhdotaZayhZFU0vEjHuHDkHeDDX3aHgefF7v5jGoQw/cx/fAgOv81plzYN+o
         kPK8892hIaQ73bhQEN8G8HQwuttzn5c5iZ+pgEUF08Ug+u70J+Ng3CzRpj/GoctTRyur
         tot3Q11GVL9oJfYXAX9CzO46eKv3dHdJYAYuxwiQu1BBw/M2/r0nxf1jWY6eWblmuEaB
         P1bfxa0/r+y7EMtRgfSQYHN2OwdRwC39JdLVQD9/KDGBlDOhZAhHOfi3+F0fu8wh1FzY
         r/Ng==
X-Forwarded-Encrypted: i=1; AKwUvBw9mUZbUUhK9HOt80PgND8Q8c9k6XKthcm7nZvakARKD+qVpEvLqAp2CnwoCBKbxN66jVFjRRn9C4I9OSF9yMJD@lists.infradead.org
X-Gm-Message-State: AFq9FYK2GtfcmA3oPU4HlndFJ+j0Z/vJCpb7+1i8tqAdt4d8Okm0bHzf
	o5PqY6QBpxgeDWTuPgRL7mYzMLWoY9fpv/YVCJhi+1wVZU7qGNWaJd0Jj4eEbQlBjrZfzI3J/ta
	Ty/4v0oBJYbJ+GTWICE2B0rnkzI8kS4AeYI7WtbAlN3NAL0iuINYwpyXY2KWyF5RA1rh2KEGF09
	/MNA==
X-Gm-Gg: AYBFou2TBx+sb/u0QHeY9sUlJnBDq0bV1nEHT//z37emkmsckMgtXGi9J8/aZ4dTaoy
	H31SFbCEg9VN8LLf0UjcVjw9TKS8O3W17HUYlsA6h1WlaIXtb/mgkFjCpnToA65XM0+iqb+n7En
	PWd2qw7LzF+AY+7GtFjb7h2Glo+4NHSeEep8BXlhu8St0BiPZShp/hQAooFi2qSwv5sdfVAYqeP
	7WGcHtx47IPpyaDpi2SZpDjHqaVC71DHxEkt74zGgJpE5a5LtlU8SmBSY3Wdmlf58O4rie2S7rg
	rHsiFhTp+orGyEaI0U+KEu6oXyYeUNFjdqYbG0GkCP3hQP9R7Aqtk9pryMnk5Xjb1Ai4CTsDoSR
	l4kPHJZYMuEfVdXsDuSTOpiyikrZGpJR+QuHvwX05RekCfw1e/tJGJHJcIkiITRib0qdRCxGQ4i
	awyUAtbbxDz00gJXDhSQhsyD3qLNMxYuKVmEI308bkq2bqm7qCr8E=
X-Received: by 2002:a17:90b:3912:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3adce7250b1mr1847194a91.4.1792738643196;
        Thu, 22 Oct 2026 23:57:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3912:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3adce7250b1mr1847153a91.4.1792738642568;
        Thu, 22 Oct 2026 23:57:22 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2994cd2sm650567a91.3.2026.10.22.23.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:57:22 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:27:15 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 6/7] arm64: defconfig: Enable Waveshare DSI panel and
 touch GPIO drivers
Message-ID: <atsFS4y9cnfKL2uk@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-6-adaea735999f@oss.qualcomm.com>
 <0d4d6a18-ad86-479d-a030-5eed8f5460fc@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d4d6a18-ad86-479d-a030-5eed8f5460fc@kernel.org>
X-Proofpoint-GUID: KSlGjie946rZ83wEAebnw5YD1Zycc4Rf
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb0554 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=phjb7eYm-OhZhg8tdxIA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX5IbhM2G2dE+t
 FlnKtdycLLj1cud4DoqKCEBc3pOT9NxwugXrMnXAzujaBKoFoqVmEASSq5jJrOOMTbarAg5qaHd
 4/GmwVZXkV379f1If8PTODUt+WLyksQ=
X-Proofpoint-ORIG-GUID: KSlGjie946rZ83wEAebnw5YD1Zycc4Rf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX3UxWJkKBHyq1
 RtE889WrtSxalnTE1sGzm1OM9w6MucCSwFDMhdxFMKNDR6iHaxcX3KDk42UAYFa5tBmrHBG65TB
 8aCzbUBDqL+E9c0tLrqxLyetM95u43z5GDrIh4zCLfA2nqb0nsKjKEaDIvlq+NF2J1YenH3winL
 Og0SHEnD+TUOskM5RuZOr2yPeKNeygvFsu7e8p0hfiIv4ICPwHzYGDe58W8aNDWg+fcg7yXGwH9
 jLf1Gm7n+w13pePCU0XsqPLGbSUtBZBaiS4TbX/63rVQ1hwD3K8Zi+tYD7FFnv/AP8zlYPytrMB
 8tAfl/ARW7HBfjbgC1vRctl/th3QugKY4VKuViViVoVmW5/sXdJhtc11KUVhygLtoqEEGqJREdW
 YSFdIVjzqWy7CXZzPnU2xaCr4FMe0n6ap3Y0A96TThefYi3PYRFix1cIy28BjZebq52yafBBVVI
 4jTKHnzUFaXlP+V29fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_235725_473182_B1CF5381 
X-CRM114-Status: GOOD (  14.41  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 12:45:04PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 16:21, Vishnu Saini wrote:
> > Enable the Waveshare DSI touch GPIO/backlight controller driver and the
> > Jadard JD9365DA-H3 DSI panel driver, as modules, for the Waveshare 8
> > inch DSI panel on the 22-pin JDISP1 DSI0 connector on the Qualcomm Shikra
> > EVK, Talos Lyra EVK boards.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> That's not a separate commit from other defconfig change.
These defconfigs are required for Waveshare panel, defconfigs in other commit are for RPI panel.
 
> Best regards,
> Krzysztof

