Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF91606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TEmd79o0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dWonRU4Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F/mnSRgX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=; b=TEmd79o0kSuEg9
	FBxbck2fTHcAZO1051K9DyRbB6n8rlaTEm4KAJ9E5cZdVq+7LXPW1sYQGtWFFCcPbqPOYBzHqs6Iz
	vBbK163PbM/dBeIj9Vu4Eip4tr4ueMfGZdMRhZjJUhJVtkd+Ks4bjgdg1GAA6HDswd3ltvwwpaNgS
	yqDde0iVHXL95kq8+XihNu4dqQH64aZLZ86VobVzIo68n3jRkpc3xZNhYffZ0Tm7C/116yVXvInFu
	wpzWaa/G7VZNxzcRqe2sVg4c74yczTRFefdz1jORhewDdqsvle97Goeu3Vp/mAshNmrSQljPa+fY2
	go4CpOwRVMH5NsmPNXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWj-0000000FlBS-23Xz;
	Mon, 02 Nov 2026 07:32:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWh-0000000Fl9Q-0Yie
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:32:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vELa2753319
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=; b=dWonRU4Q+/LEfOMw
	nvCbJdrIzu4jsc7tq5zoseQmsFCEOORMyF41B9D6chd9bfBM/Q1G6mAW+whh9MYT
	pK9uxM+o/4vH49BL4t4bJTt9bifuHeSYg2sLJO0JGm7fC8KrZp3rsHI+VPQKccqp
	uWoj4T3hYqHBn5+R5q/mxN6L4zpxVnGj8RI7o+L8Fi/ZAmTLXakkHqvvOkICLAXm
	13HLDGNQX0Ye0HbnBimrwCqeDk1isaPwT/nRUKTUvBXC07TdPus7VTVObAmO/CDR
	s4thpjEpLAnzk81nC3dDgq+SVevVQHemb+Ohd/6XeAo1pMSLw3aqrzPWp1SFl61Z
	60mhrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg2015xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:32:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea381ce04fso34050595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 23:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604737; x=1794209537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=;
        b=F/mnSRgXFHX7dUkOP8/YBwghrP3tg9cUe/YxiiYPx6n3syTghxwYdJ0Ps42/wXq2Gk
         +gohQ97K+/Ic5ExzJGON9QAg9b+SSdUNLFEA15w1WHdGYslo5uKFdb7reUm7xGgNmIKA
         Xol4JCQZ2M3Bxos0M+1yJhSfG4UkHaglq/IhXdY3Vxq12eXP139h1RgNNDUa2V7NKFkj
         BwEmXMo4SOAzFJ58unLBLyADN+9ECABlAcZYgK5ulEm+MIfmKmoF6bte1CRpCqezRRlt
         BZ1Y5fMuru9/WiZszbEky4KtoLK5/T9fWOd8Ty476HQtxEeExyBrOMfGm6/KWr0a3CkJ
         1mZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604737; x=1794209537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=;
        b=u2DmWhUp1R34J0JZN348n9rzJblvEn5B2/091OSJf/ZYzJDR5aSLFKsqWbXTLB6N/M
         nOWCNJ2UgND0KhCGLYFRGImhH0OwHEuDiCMtYNS37ywxeJ13TAvfpW3QwvcN713M4wTq
         NPgbZYQgcySj9oLISjyOs//oRr5VhCqOkmiuAq5vaN7DoDTYkycWIIKzPcJzrdV7+M6M
         PGfP0QS+2g2rx1mhasG7ARzctADO7mKUGoxBni5Ubox7RkBcICIuuoebIfoUDP/a5q8s
         ExegX1+SKWomeAl/5En98O2EQQkciOjx8ai9B2KpUrREghL+DfvoCaTxXnHsAQtlJ/hc
         LljQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7QW2jH/9E27s8Y0O3XCJgvWR2WrDzNs/pLB3z//LfpctSfIaCYQCv/xDiQSwRGWYaGIGAG7RRMAm9v//OPaE8@lists.infradead.org
X-Gm-Message-State: APuU4Z9kTyMOh/lw51nn42vgh0iun85XGtNcamHVxT4N9hNK+ydPemxB
	59IIwOXum1eXFJdHuyCj2jJXpNnBDI+HSVn+9uNuyqomddiitQCed3FGrHfoHs5cHQgXLnFhIj5
	8xKDzV4KGIaqb/BMZvc6vPcqRkbY0d5OxfvmjTC/EyG5te0WcA++y7D7cfjPcVpPmSSLPYXHP9q
	apJw==
X-Gm-Gg: AYBFou3aYTuVkqzrp3FZ/VoXEuqoXWsUw73XjfK01vZttzb48Jl/fuSWe95BC14FEk8
	SLbFlPht249225CKPfXe48XitpVkmFvHfQlcz1ASvk/FPbP7jsPwJO79//HL5vT8GL9L5rMfjAP
	C5V6xK0mBOy29En1gNkW76/co+RqtHpkcQgr7KuowMN5hRSnnuiyvWQU14oEoQn2wXfoj07T47r
	6WWGTX40ijLBvOMtcdAy/NFrmN1IXBpo0bFGyRwB7/yFlUt4PSS1fA2l9mpf79uvr0XSUN5tozm
	DFjh8DIrrBpWm76BAB9DLfCtDIC2MxE/ksF1sot0ehB0HK2BDq1n3I6BAVlWToMX42bLS2mqIf0
	vrxx8h6nQL4kOZum1pS8W1EkQYEqy18jPL6IHPGEYnVQiUK1Kvs3mYPQJSFwIwskhHNpHn3iHum
	So97JB
X-Received: by 2002:a17:902:d4d0:b0:2e5:1069:fc11 with SMTP id d9443c01a7336-2eb1aab5040mr79983395ad.1.1793604737327;
        Sun, 01 Nov 2026 23:32:17 -0800 (PST)
X-Received: by 2002:a17:902:d4d0:b0:2e5:1069:fc11 with SMTP id d9443c01a7336-2eb1aab5040mr79983215ad.1.1793604736850;
        Sun, 01 Nov 2026 23:32:16 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:16 -0800 (PST)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:01:35 +0530
Subject: [PATCH v3 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-lyra-display-upstream-post-v3-5-7f660c3b622c@oss.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=756;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=D574Y22uTji1IMYHtzDZtLzIycKBRn05fzUPAQ1Xe0U=;
 b=/ZryEtzmyp06P+iMnFK9/3xFBaYu3B6I0tOctWwl5MAOe5aUs4FQw3ghXnuw/3LmliZqtsg3b
 jw0bmq+2E7hCcOU15UUe4MdnXg8EggGKKKH0DVUrX0CF7blBAziNY3s
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: Lo2mVVtl1t3xpRtgiHqmETQZ-Y90atgn
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae83c82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Lo2mVVtl1t3xpRtgiHqmETQZ-Y90atgn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXzTqnrNoWxU+t
 BAchxUD/ZypBNJ9BjIeUWrJeC6xBm2MPHM/K2WLUfkBn/u98i8mpuHhyWevYbvif1UqP1Osc3Op
 pJwWefqlzbKgGq2Yit1DwfN3yhbq6z8CrwYqC1kMeAOByK0hpAJrDS6WGQ/YNbXNdkd6VUln4F4
 sBgR/F06k8xdWKzLLfr/0OSAKniD8z+N3qXNZCKF7aUiLTkcGMxnm0tk+aigE5BdhL0BLHF11dF
 quxrWfYdDkBb6QIWG8LECATuKw/W7noVcVDaUtb1PeIAnp7IBGxTnDrug1wAzjsL0RlTDvgnPUg
 35WLRGFt65FyXcwUV4+qhbufHznrbEjHTyPV/HZH3q7E6Byt1ET1qMSwKwxvQivW5dBu3lnTHn+
 sJqk7nJ+LYVAM+jp7E0IeoC7pZNGOBhfSP9wwuLe+v866U2IGFvFhNewt6eMR5is5TuSiwkAojh
 VxPDlY1XpVRjHEzdDzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX8KqastWNY3uH
 g7ajdxlV7sSODUYr6QHTNWVEwNA/4LbjjNi7pvXIZUFXz96MYQ5//M3hVql7hXkTDNGjKxIwc0B
 HZ93NPV/Zvvl4v5VZ9C0ZLZ3zEOszGs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_233219_294328_72DD164A 
X-CRM114-Status: GOOD (  13.82  )
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

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Qualcomm Talos Lyra EVK LVDS panel overlay
backlight.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..365a69470d13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1620,6 +1620,7 @@ CONFIG_PWM_ADP5585=m
 CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
+CONFIG_PWM_CLK=m
 CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_IMX27=m
 CONFIG_PWM_MEDIATEK=m

-- 
2.55.0


