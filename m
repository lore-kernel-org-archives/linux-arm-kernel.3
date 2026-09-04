Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75A4C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmKN2/HQZks0tpmHaapx54nupIE8cyQNKHSbzgNzJiQ=; b=fdxHstN0d6/xPDNwguOjpY9aw2
	G/1PhMgnAhucwEaIjAV0hEZ4l9jcSgleIA20CWcD7IWTDJOMKjyWp0mF8WvyOiEG2veh3DptZ0/yE
	CpkhsjFSGs4tUD3irHGStwDh7WfbizJAJxLVw5fVeuYnnWSCDW3QWEOB3dLYlVnOEWxCr00NP8wnu
	p++/24oFhI1QXPYUA3xKe/1sWelC4VYtwB8QfsqKNuiC3Kf6nu/RIOTLfkP0fNNf4SOsevd2jp4oy
	+NGQQozZKYc6Nx6MvH9kWXW4t9xjrDbWZoh8Dbx/+1bpgLGsbM0oKiL/jePyO8EjQk1w0GMlO2dMm
	Ucm3WCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2b6u-00000003IR6-0SyB;
	Fri, 04 Sep 2026 21:06:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2b6r-00000003IQk-0LuG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:06:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Kb2rE1568248
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 21:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pmKN2/HQZks0tpmHaapx54nu
	pIE8cyQNKHSbzgNzJiQ=; b=f6tqP/YFyo1lXLN2qbefS6WAXA3eHAq623fvow1m
	GSNGrPJZg5nEgTLReHGhb2yx4uLZTnrbVXNl0kXlLZMhTuhA5yJ9hvnDZplw7nXj
	Kz4i8xIo3AGWJhWSEFIoDJNio5RbhzAFoBCnAXJQep6LcAClfkDmd3i3ZSAmXg1F
	qSpPZv42f5QJ2mLUzoa3mQyMvAy2c35UCAG12UgfnfGGFuQ0s34wvxW4rUCGiKfr
	ajgOY+nOGJvkz44ft2VqlxQtvdPf6QkZvjuuMybFBebozZfh37kVd4XrNPDe4L4g
	4p+ZPYHvsfN9QKUhKNqkGWuPklMZI+r7Y5pkwjoAL8EzVQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00ysp24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 21:06:04 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1aa28c903so1039730eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788555963; x=1789160763; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmKN2/HQZks0tpmHaapx54nupIE8cyQNKHSbzgNzJiQ=;
        b=Gvs+3EiGLfkn7BXbb0/nZjPY08VoRxedyVflx3uCFz4hVvFuT5nR02RRhMlbPLB0mn
         thfQjbzP4aEkg8PTYcrogg5OhXHjtH3B6MKy3mYHFWS+cAYOcKj/U/cXsXpKSWPgCy+L
         9mQlbKHIq5gp+j0+akVH/yj/1aKAh0NpvkQYkaILKHHcEsFOg+dFOno5m8qwMEFc6mxZ
         /F0SEkZRb6TnoEPRjx/LhUycmD0USJNeoMtLamNXvmlkYYvTBFPGeJwrjVig/SEdTYo/
         gWNfALQ9z3dqJUg7cOUNDU1mBr1IjpHYCWZXkJ5ydYj7HNX5xIu+PqUYbZMAOzgsMWtm
         2D1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788555963; x=1789160763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmKN2/HQZks0tpmHaapx54nupIE8cyQNKHSbzgNzJiQ=;
        b=QJzE+HIOEiKzmKkTwqTkY7jQd29uJXD9V+omwLfkEGTxoiCx38OgnaH1FE9uriMR3W
         1QyQxN9/j+qsd0i4vgivysYwZSurWcF1zCipDpTkM0QcAKYQPjiOJ+fPi7NFBSMV+0fj
         0mMYP3NaAoIikuHOf7exZExd8YsouOACWeCFNisi/xVRPak7RKxWPnPsk/i5hjwrykiG
         feuDexru3jc7TyJqkjAMbwXi/xR5sl+55Ib1ESpn+WJzqpWneYWQ9CCvwc0HAbcPU114
         vMedWDwJfZIMAPoMmgKipwvlP5AtkjFRy+2Y1CPAZ2BiaCQsbBDfn46fX2f+fwr3/oS1
         NZcA==
X-Forwarded-Encrypted: i=1; AKwUvBx9P0QtSpaze5b0DQ8EoPbi8TDw3LzgJgwKQ132wYWndNAFgqOChP8JLKdacxgnqavVUjPdnGjOod7jaBUeUi6i@lists.infradead.org
X-Gm-Message-State: AFuF++lMDPa0LDlOeeC4u0rUBQApoOlB/l6Bmo24EAJcEKAvDXkCLDfr
	pHge7WXJ0rq4A8QbbxUn/011Rg/OCYWeuRA6R+eEQ445TADEmuqgtHKXZCbf93liEcUBtzxs39G
	j5armFMVTp3DfEcvlemDTvgW3XsZDB8YN4zP1gbgKRdiJjdGZtQHXvxG0cGjG+LlxlwXg7a3jLo
	iKcQ==
X-Gm-Gg: AYBFou03yGomcDJBxM28ONxEyybxlPaaGYsVFA34tIi2vvERx3C/FN+IObc5+n0WvY8
	AdEEaGGO+GMehtw7b50J38M6MKkSBmNWsWRp26H4akioGz45eU1qQshMNlkZg3Ym4DTAKuMX8Y6
	nRpBiSt2w2un0ry47Y6Ja7hXow3gNQXsACdpklZAWKsJfHbLk0JvLKu7bR7gQpeAi3pqkLCDepr
	e91z+ugC06WDh+CfG2oLKJzwKse2bNEmSynU3MKhw7/u1WVvUadgdl+QJvSegEf+4r48E7DS/1D
	lM+Bqq/YHYP+t9fxSlC/Ifg+0WZAcMg+onOutL7vLyGDeqIrMOFAYLUja0OGtCtDN3HsLv+67VW
	HCdVxKNW5I90v5Q==
X-Received: by 2002:a05:6820:4b88:b0:6b1:bf3a:ed8a with SMTP id 006d021491bc7-6b6fb4d7bffmr5403416eaf.14.1788555962990;
        Fri, 04 Sep 2026 14:06:02 -0700 (PDT)
X-Received: by 2002:a05:6820:4b88:b0:6b1:bf3a:ed8a with SMTP id 006d021491bc7-6b6fb4d7bffmr5403371eaf.14.1788555962494;
        Fri, 04 Sep 2026 14:06:02 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm8692399c88.13.2026.09.04.14.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:06:01 -0700 (PDT)
Date: Sat, 5 Sep 2026 02:35:52 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Message-ID: <apsysH9ia4x96a2g@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=baFbluPB c=1 sm=1 tr=0 ts=6a9b32bc cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=T3LL355Ksxp6dEOEn3QA:9
 a=CjuIK1q_8ugA:10 a=k4UEASGLJojhI9HsvVT1:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: 1dv8W9GabbYqxAmylCp8qjnmT7vqb693
X-Proofpoint-GUID: 1dv8W9GabbYqxAmylCp8qjnmT7vqb693
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE5NCBTYWx0ZWRfXy6Vqeamjsimc
 oVsoipCtcganFZOnLTaRx5Dyqos4xGuEqM1afEOPqJMysSvGuKEChqin9Q6VF/g/fLk5MNwuduA
 miBVmRf4lwxobFax9MKAsQNWYUnw4mTiwbGrMLwx9a/dA4p+3clg35Hu2J1FJLk80QP7LyQNm/f
 jNfshcH3pOjNmz3jNl2Fh5tv4T/WoTBBpQ/jkaboD/c8yi0N4zbjM1xAjfzWCTib0jz7Va4A7Eu
 IEPylmLK/cM//C1nFdCOURmlwzVuq7aH9k4Pc/hO+ZB+fjwxGrEeR7hFg/pRPKDJcXdVud3XfIe
 7WsfJjZ4zbFFwZkXJtuzK6MEl4TfUSFcB85FdJ/bfD+gtRM/FBTjUlZdEPEieODc65feww4uYG3
 PvFigKibw7cWjPKWf2BP5xLga7xEdk7Pt6RxhsvbnPc1syJUjucpYf8U+cHhcw30SO7JjmBbrwT
 VSS8KpSbuNTYs7vs+kQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE5NCBTYWx0ZWRfXyZIQOEWarv/1
 twaNFhWcA48X8NzLX4LHi8fM+hJPqb2egzKcyCpwe+xs2Uf9mE7dNJcBPlRYtCUARH5mWbjtpcz
 6C9KJ4dtpSRz0DgNJlXTtQzb1+YmcAY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_140605_166625_B5138A92 
X-CRM114-Status: GOOD (  26.33  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2026 at 12:13:42AM +0530, Mohd Ayaan Anwar wrote:
> This series incorporates feedback from the RFC and adds the dt-bindings
> and driver changes required to enable Gigabit Ethernet support on the
> Qualcomm Shikra SoC. DTS changes will be sent out separately.
> 
> The series has grown from the RFC and can be broadly divided into three
> areas: PHY power supply management, proper support for RGMII ID mode in
> the Qualcomm ETHQOS driver, and Shikra specific clock dependencies
> required for NOC access.
> 
> 1. Shikra EVK boards use a GPIO-gated regulator for the DP83867 PHY
> power supply. Patches 1 and 2 add supply management to the DP83867
> driver so the PHY driver holds the regulator vote at probe. These
> changes are largely inspired by similar work done for the QCA8081 PHY:
> https://lore.kernel.org/netdev/20260605010022.968612-3-elder@riscstar.com/
> 
> 2. The generic RGMII fixes from the RFC remain. As suggested, an
> additional patch now emits a warning (patch 6) when the legacy "rgmii"
> or "rgmii-txid" modes are detected. A new change (patch 7) now
> initialises the RGMII link clock at SPEED_10 on probe instead of
> SPEED_1000, dropping the unnecessary 250 MHz source before link up.
> 
> 3. NOC clock voting (patch 8) now uses dev_pm_opp_set_rate() so the
> required VDD_CX performance state can be propagated through the clock
> controller. The Shikra binding (patch 3) is updated accordingly: an
> if/else block constrains Shikra to exactly six clocks and requires
> operating-points-v2.
> 
> Testing:
> The following boards have been tested with this new (proper) handling
> for RGMII ID:
>   - Shikra CQ/IQ variants (with the TI DP83867 PHY)
>   - QCS615 Ride (with the Micrel KSZ9031 PHY)
>   - Talos EVK (again with the Micrel KSZ9031 PHY)
>   - Talos Lyra EVK (TI DP83867 PHY, this board also has a GPIO-gated
>     regulator for the PHY power supply)
> 
> Changes since RFC:
>   - Two new patches add supply management for the DP83867, replacing
>     the gpio-hog approach for PHY power -- Konrad, Andrew.
>   - Use dev_pm_opp_set_rate() for the NOC AXI clock and require
>     operating-points-v2 for Shikra -- Konrad.
>   - Warn on legacy "rgmii"/"rgmii-txid" to encourage DTB migration --
>     Andrew, Maxime.
>   - Updated binding document for qcom,ethqos and snps,dwmac.
>   - Drop the duplicate "axi" clock from Shikra's DT; use "axi-noc" and
>     "pcie-tile-axi-noc" as the only additional clock-names.
>   - Initialise RGMII link clock at SPEED_10 rather than SPEED_1000 on
>     probe.
>   - Link to RFC: https://lore.kernel.org/netdev/20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com/
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Sashiko raised some valid concerns, I will update the series and send
out v2 shortly.

	Ayaan

