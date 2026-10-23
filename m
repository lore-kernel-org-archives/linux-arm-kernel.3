Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A4606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X2POFLme;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IUSmHvAs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWpl1SgR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=; b=X2POFLmezA4VM15f4e5Evz9Ap8
	ZbsdQeY57xBTxyPcMCcWZJjqeUORGPut3xjYirNDHLMsBdxBmMLcs5UBIa0BADGFM/hCr5+h6R5yb
	p2oWGYdmmcz7uyAGAIGWrM/PbQEcgsHVYhQcycG9rN6mfgPxXR/H0t6eSzK39pr003NyQk4DrpvMu
	SYj7bW8mAzeq/RMU4j/adKvW4sco1EvoLylEPrrXmepsfhwLVfswgOAmKmiSS+5IPagxmhtTmyRRU
	0NnMGlJjFulMIICAunUvYf1mMRwTQ+iQZ6khxmavuX0ylg0iPIJJLJhzQpT4b5Ri1RhZc5VyUEYqS
	1Magfz6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9GY-0000000FfgQ-1nNh;
	Fri, 23 Oct 2026 07:00:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9GT-0000000FffX-41Ls
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:00:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FBf11792147
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 07:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Li6ecssWAKTyIqGTgzg996bM
	uxChvYuVzdJanfbIoyg=; b=IUSmHvAsgjbRvDHLbpw4xaj5zBPceQmfN3MLm7ZP
	mnLR1VvyQ2kZWRjklFKANC990rumGPWaIPxhGNHbhtdExLqBDW3WNJ2tsA6umb8o
	1dUshLtrNa/dSh3gUBmI5WQxtzjzGEPeidxX4So+81Yn+p8iQN2s5sgPkz9/F9mf
	9AGoFD9p4bHS0yBRwvq4WtAyIRv35LbK2ukBHwgk8IT1tR56zS4Ssdiez8cJV5rz
	Uo+ctmaH7uzwBS1OXopAZAT3nD8u7lNi57ihjHzvcqUwynpEYKSjsO2tCMKSik7L
	ZKCms9yi4lzAtnLSO10oXjFmINAxk46Nuq/RxmtwUBcWdw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0jw9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 07:00:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e94a7893e7so1011155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738831; x=1793343631; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=;
        b=FWpl1SgRC0U8CUK7vL48ifD4mTYVMz/9C8U/yzFRgshv6qiomr/sPDVYcGMxmZCDgC
         Ddgrdx5PVIk0Zw0dqp/8R1gla8DiA6l8izb3BU7uQZMubQ3vj8Ipf0ARCtK3RF/fznj/
         jKIqKL+VHLfPCg1TJdWQeCWRXutg1NIpYMGGD6DHiXqW5rUEaJorhkD60jtlHzgNaYDi
         I5dAHqwzue+BaqnKJIhBmh0DE3MM+jVvLPpjupGaY+7CvILLrtMEwPPNBqGFC28ST5oT
         hOujj4De+VQpDjjB4gfHukP/+5oDJGSIXJjdGwflzeCwbrjy1DiaQaVaqFRotp7NKe7d
         a+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738831; x=1793343631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=;
        b=Zni0+4H1z2GI37mAMhNjGGuPdSxNF3bvynB3Xws/A8nRs+2r98UpAn/j9hgq93l2bM
         CkNFcEEjUHXJvYJV/KPATnjT5J8NpOI1XcJKpt3X9GKPc8ht85uHDDaz/gVK1aoX1QRN
         QkFaFjsKYVsS6pyyg3pjVKMbeKMkEbpuEEdaNroXJjS0LXDFx7eE3KjujEM7f46RMt3v
         jUDxxUEP5ecqJ3FXXwwtLQmrbQmyEBmMhk2tayhslvAaD1RwQWICaNWKum9g1ngONcF8
         qkscVD4vGKh/V6wH0Y0BuI0YX4eKyMH4jP/GJQx5u2M8deWhGCOap/Hgo55dlKiU6sfj
         H3Sg==
X-Forwarded-Encrypted: i=1; AKwUvBx0eAsqn3jGAmSdrwxlbIgGNTITuGgoBiqZGGORsiRj3e/LBlFfz/AOXISLqqzcw1n8vekju9uTvcBLG63cfnor@lists.infradead.org
X-Gm-Message-State: AFq9FYLQhFvOoaaRyWeKJSXym0sIBwUVMZfakCXJinFs8ckgsxMPYot9
	hB696TyP66A/LKAHHPunh1K4uzhF8lSk24NRqApusQR1p6wqcRs4PRFOp1jUfFYBvHN6dUYcquG
	IyDwPx74dy/68bpSD4bpWvGkgZ2xbOxfIZ1G2A2BOLyOorHosfMWRfXJRltS9tqjQGhhhg0GWrL
	pghA==
X-Gm-Gg: AYBFou3FHqoNu8JGS7R4MDSJIKV+BI52gV3+9agTppYLNeZWoolV2cFAFCB913jXWww
	T6oYBMokzeClwRKoVg45/DPcSx4f1/2E9A3MV3d3g8RknrsJzzEAh0mQP07iszxjuzfon+NjyxV
	xe6nPYMAvaCDBoiYP0xR43QD0/vWwwynky+mmerwsUeERyvQCTWTlXZDJW7aAp/GYt3pdTnpS9a
	lUuqHCNOxJACYyXPE2Q6H7zACFxLdELosfvv/KU9YmzMjGVxFKQqC/M6+jmc+2z9NAFKeRfBvuf
	phDHZFI0XNqe4DViLgVqxBR91xFI3ObGN+70PlK/cmA8uykkBPyeHyoANm1dCG536W/b2hxGoa+
	0pdzBjkQucyy+cPARLlbY99KTf2QZAxLsvBI24or3JFK6Pci16WCtnjN6foL7ANpE7VJgQkO8GJ
	JNL63KnC0xJ0oMNs2COCroCWdCNiZcaVdbH7eVGVeSLfJlq6Eh6tc=
X-Received: by 2002:a17:903:32cb:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea7d0c87acmr20794045ad.3.1792738831190;
        Fri, 23 Oct 2026 00:00:31 -0700 (PDT)
X-Received: by 2002:a17:903:32cb:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea7d0c87acmr20793695ad.3.1792738830688;
        Fri, 23 Oct 2026 00:00:30 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3bc54fsm6202865ad.47.2026.10.23.00.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:00:29 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:30:22 +0530
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
Subject: Re: [PATCH 4/7] arm64: defconfig: Enable RPi touchscreen V2
 regulator and ILI9881C panel
Message-ID: <atsGBkugguCQmOo4@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-4-adaea735999f@oss.qualcomm.com>
 <4b05475b-443e-49d0-9bfd-d78388246706@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b05475b-443e-49d0-9bfd-d78388246706@kernel.org>
X-Proofpoint-ORIG-GUID: YrhdoQ2PmztpQUq0IZgh8QewvWfov5i7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX5sYJ+sLolwzV
 0/S5F8VMEy0a99mYsEYMjnhhcTY5fXYA+NpKxKhPVPxpBdtgCWLg5+mFyXH8F9JjvRp8QYYYnbj
 gHh6j68iIq0+dHPV7OcM9qjs4b6pekj7PJrqwM8Sk6UW82G9A0QGMGSrnNu0TSXduervcQ4bdgb
 GchFggcS07TWtVb/vNfEj/LDne6/BazycbaVdG0gbVQUCPfXRE2RooL95L5RtTaH+u7Dn37Rvoj
 bbZsN4OaQxUYK/wg2gEOrThW+P0QSuj52b3tCGm0kzanyJkMS5JT14fOr3Je4VnvjFewTaSC8Qy
 acWzfmQgBiimZ6oSJeeVBOef/RjplTSwUHX5YCNjD1SC0EiE50nNZ+mL6zXuCDem7g8vve4DbMD
 VdNuS38AxLPIkDs1pOQlGR9pMTDp1L9G7o+D1DiTo44NoZLOa8tZo/Kv68Eg335+95aN2hbe5t6
 3XggIMDTVDae9rpomaQ==
X-Proofpoint-GUID: YrhdoQ2PmztpQUq0IZgh8QewvWfov5i7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXzCGmt7+Pl33Z
 gvc9U9CxQAS/6Kms7u2VpnW/fo2yDpy1SLrV0YwQwmHBt52bti2Slbh+aGwe3k7Y8EyOi1ycHNa
 dNP2hutjO8g6VFGpkz1/0spE4udBc64=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb0610 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=nis2Za4te4CX2erPvBIA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000034_112475_C54F354D 
X-CRM114-Status: GOOD (  16.11  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 12:45:50PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 16:21, Vishnu Saini wrote:
> > Enable the regulator driver for the Raspberry Pi touchscreen V2 power
> > and backlight controller, and the Ilitek ILI9881C DSI panel driver, as
> > modules, for the Raspberry Pi 7 inch DSI panel on the 22-pin JDISP1 DSI0
> > connector on Qualcomm Shikra EVK, Talos Lyra EVK boards.
> 
> I don't understand - next commit is saying that it is enabling this for
> "Qualcomm Shikra EVK, Talos Lyra EVK boards."
> 
> so why same work is visible twice?

These defconfig changes are required for the RPi panel, while the ones in the next commit are required for the Waveshare panel.

I kept them separate per panel, but I can combine all the defconfig changes into a single commit if preferred.

> Best regards,
> Krzysztof

