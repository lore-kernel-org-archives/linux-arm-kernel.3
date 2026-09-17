Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF38C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDl35+VXelpsEbre9UpAeTzdT2GlQK1m33TbNXBDA+M=; b=Iz82uV0XaaiK7LqQsFIeYsdJcO
	Vg/YgNbpNyXKL4zt7TMaXEcB2LJs9iBkr1Y93auF2I5a6+d8GG/Gkb3hL/IDLEPPKVR2NoxRHZHHG
	eURNljuZCvdCb38CuSBep0T2CB5EWPMNkB5QLfzrBCxypbpxdaug4+K+0IbjjVUpMUAYjZxQQJ62h
	88ZLyIzq4MgePlYnxPToS1Hs8s+LgRHPHNkmyzwjTJiYJrVCEZVJcxGiIW8tpqJX7IR92IsQ1m5F2
	MZH3gDvTcxM88m7X0p9hVz5Uv9hf8uBJA6slJ9dpuoYTNG3qvC7NBfD5s6XGDtncu8fDvhcb+iH0r
	7Cfpa5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FYY-0000000C2JO-34pY;
	Thu, 17 Sep 2026 17:05:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FYW-0000000C2II-0owg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:05:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5ffi2170961
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RDl35+VXelpsEbre9UpAeTzdT2GlQK1m33TbNXBDA+M=; b=Tgd3GC9WhKH7gyHB
	3DIAh98G11HYVNgr+D7Tum/1A3Tz7K+TZxY4NV401TMseciyykXB269mWw6B6zbs
	jHxfmNX3FPf5ya8EI+Lfq8xbUpWkMXjdf4EbKkadvKH6l7m1exjjyvY/gzDC5dU8
	LaHRFEbpXRVi6QfKBXIC5pkGiUubaTcg1NNxtkEUXq0RcYfwi9b/FSuwcrvIzhFx
	vSb29F9dshZnr0HRO+67md7iLZ/T3xQHEOYZi6dVvpSERUVTCzylr2lcS/gimN7R
	CKyy5QN6+YXVNcjaK1+ZtC4f4DVzG2/F6nFJeK465yVXeVClC2/yU3RNeOTxoj1B
	M4X/FA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grk97rbem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:05:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so15043495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789664750; x=1790269550; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDl35+VXelpsEbre9UpAeTzdT2GlQK1m33TbNXBDA+M=;
        b=FN8XxWiPQhLStdHtXFtbUKatPI8vv6Ps9WST3GCipn/jI2lWZa97XDmxVsv6Y0nApm
         eFp4vIji1jbWrbPscJNXavuQ5fa3n1MB6dy8Tz/WibidJ5oDF1b0p+PMQ8YdwvVS6oU2
         WKyhJ0FzM5HfxKx9aI4UOpwqXtMC+ImWsjhaEnQtJJ0RCjliMosVST1pL/nR1tkPHxU1
         Od32ePmwkO/ocC/hohNZ8FUxvyd0tWkNqze0vfCCFjJSeUU/Ui6gWaUNQs7WRwEWs3xb
         n9OSPhknuJ4fNl/ilLdnSvwaSyTBSIgxpwfQU/MSAhCMfrnMeJqHQc33CbCNphw+1dZI
         AIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664750; x=1790269550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RDl35+VXelpsEbre9UpAeTzdT2GlQK1m33TbNXBDA+M=;
        b=xPmUfzeEkGMepHJoHTc3K7SnJ8EFHpY0dibl446iY7u8HPYstqC+GjFT0K56MeA/eb
         K3df4kZhCzIeeWSHwfhEhRwlIeRfMU1WzpXn0PhJ+q8kD/92YsI5iR9kpvWD8ArpWX8U
         XXzHlggsAqEihzsmpQJXq+YUSKTdi41anVmAUvvtsyiilkrCghd4DSOWrI6KmO7dRl7g
         Y3l+GjyvVA+OiibRyQT90gdoN/55p0WMXKDfjQ1Raez+CcyWBFeJiw1yK9A052gtZMX/
         jpVUde1c0gIuM01rhA3J8b27xydySRb7UwBpz3XfsfsyzBBfvN2zwqP9/aAfO/1WoUPV
         Hy8w==
X-Forwarded-Encrypted: i=1; AKwUvBxDY5nfsCITjyrAdt47ISo2xC+yY/qLofDaEy8oIcuZrBMOtWR3FfuXnPnI59K1JZtZLM3fwS0dO9zBHeID5PbP@lists.infradead.org
X-Gm-Message-State: AFuF++kGBTThoX7k+esMJKJL2JqGDiko91ulmZ9xjLQSa0touCqL4U/T
	ltmMbf6Rud27gaDGsX/mqyGWnvgfAABbPZQp5CxnJp3YWL+5fqy+2TsANqQf2qRytpVDCyshmLn
	Pwf9p+NjPGAJHDy58VvXoWvbdwpUhg59iDC99oOPp+yPKodg+n5ZUbbcUdoi9qeMYfKES3IZquc
	r3mw==
X-Gm-Gg: AYBFou2cYgM+UEukAV8HgNM7yDLyjItWPflhoAYiIeWZ2ZWsPLg6uUdpyM1YxEhuP4g
	dmiwcFysHlg+wmdQHAvg3jdoBoD998PoNgNf6y1zw0+3o8QKBWRxKELxvN8Ex5b/6fvK/Pl6Nk0
	GVf9l5UumMZ4HuSAihEFiryTX21NRAccrZowsQgcuAgftV8BJ4wCKLgWixPKsFLE4gQBPyv89aL
	vVU4rJ4t2q8KoYocGwh4IFIL2iidVAO3Gt7HUZJ6e6DlWlMan0f/Ntf9W0rFeouVzi8Uz04i1Dg
	vZlcZEd0mp9ZNWBAzh32IJNV45eaVaanuEJoF59TSQbjkmLiKvji8hAtuWTA9LdwXAJSSIYqyw+
	SNRprK8XXJ+Oi
X-Received: by 2002:a17:903:96:b0:2dd:ad74:ac82 with SMTP id d9443c01a7336-2ddad74aeadmr12637665ad.29.1789664749526;
        Thu, 17 Sep 2026 10:05:49 -0700 (PDT)
X-Received: by 2002:a17:903:96:b0:2dd:ad74:ac82 with SMTP id d9443c01a7336-2ddad74aeadmr12637115ad.29.1789664748859;
        Thu, 17 Sep 2026 10:05:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ebf2e2sm30693095ad.42.2026.09.17.10.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:05:48 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:35:39 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk, richardcochran@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        joabreu@synopsys.com, maxime.chevallier@bootlin.com,
        mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
Message-ID: <aqwd482ftepFnbJz@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-4-bbe3389d0652@oss.qualcomm.com>
 <178912591286.219967.4678568368277035940@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178912591286.219967.4678568368277035940@kernel.org>
X-Authority-Analysis: v=2.4 cv=LOzz05W9 c=1 sm=1 tr=0 ts=6aac1dee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=qlcCTMnHKW_kJwwR1w0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfX3IcYDh813BnF
 tc7HaaRZw3tPJk83n2yyWHGWl0eS8TBdIZze7hxtLe18FXtvl44X2yV8qeWG+UK6lI8CJuvcPTu
 QWeHPNvkiJN2vw9T/5CUDYL7UnRmbk3KlNz8jdR5EoBb+E95NLgTLYPdVPNf6TVbV4cVGtqy0p0
 sc8BhTROuxjh95aDU3cL5QZvW5BJbOh6OTkyF2wXdJm5DehHb5x1aGylUavYjyx5GWwcQkDuE43
 yjK+o7ZdcDxgdNw31fzUy8ulGcCvRoAQ4a+9wOwwtpchtJE5FAV0hZX7Pi3DPELNNGU2ulq2dQl
 ygwzV4GzgLp17sr4c5hnqguAafRxDd6iyyBgPC7fjpe1eJOI65rgA8WquFGQhUCrvQgk4BRQgEM
 10V4Fck80G/lU/SD/zNz3lr1gNpU2AbP24BAdY0VVjDDjFeHLyA9YcIOo6yiXALStbTvs8yH8td
 GEEgziIsTAzhcZHAZIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfX8THteFU/GxYt
 BFsVeV6UC4GF7SUEO9DQHI6Ze2sUJ0naa+i/ERztDrHkfiqjSRFx5AyWNUM3R6pKQhv8FvdO247
 PbX96C7sNep5qZNSyoUKAA1V3vAyFuk=
X-Proofpoint-ORIG-GUID: gARB2YxyHXV_KZxWb-kkwklj9moScapV
X-Proofpoint-GUID: gARB2YxyHXV_KZxWb-kkwklj9moScapV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_100552_359246_A59A7331 
X-CRM114-Status: GOOD (  37.00  )
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

On Fri, Sep 11, 2026 at 11:25:12AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] In `ethqos_rgmii_macro_init()`
>   (drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c) the patch…
> 
> --
> 
> net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
> 
> The patch changes ethqos_rgmii_macro_init() to return void because its only
> caller ignores the return value, and it drops the speed validation from that
> function on the grounds that the same check exists higher up the call stack.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index ac7d6d3e205a1..44270c25d874f 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
> >  	return 0;
> >  }
> >  
> > -static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> > +static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> >  {
> > -	struct device *dev = &ethqos->pdev->dev;
> >  	unsigned int prg_rclk_dly, loopback;
> >  	unsigned int phase_shift;
> >  
> > @@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> >  	/* Select RGMII, write 0 to interface select */
> >  	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
> >  
> > -	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
> > -		dev_err(dev, "Invalid speed %d\n", speed);
> > -		return -EINVAL;
> > -	}
> > -
> 
> [Severity: Medium]
> The commit message says "the speed validation duplicates a check higher up
> the call stack".  Which check is that referring to?
> 
> The only path here is:
> 
>   stmmac_mac_link_up()
>     -> priv->plat->fix_mac_speed()
>       -> ethqos_fix_mac_speed_rgmii()
>         -> ethqos_rgmii_macro_init()
> 
> stmmac_mac_link_up() only bails out in the default arm of its speed switch:
> 
> 	case SPEED_2500:
> 		if (interface == PHY_INTERFACE_MODE_USXGMII)
> 			ctrl |= priv->hw->link.xgmii.speed2500;
> 		else
> 			ctrl |= priv->hw->link.speed2500;
> 		break;
> 	...
> 	default:
> 		netdev_err(priv->dev,
> 			   "unsupported speed %s on %s, leaving the MAC disabled\n",
> 			   phy_speed_to_str(speed), phy_modes(interface));
> 		return;
> 	}
> 
> 	if (priv->plat->fix_mac_speed)
> 		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
> 					  speed, mode);
> 
> so SPEED_2500 and everything above it are accepted and forwarded verbatim to
> fix_mac_speed() regardless of the interface mode.
> 
> ethqos_fix_mac_speed_rgmii() does no RGMII-specific speed validation either;
> it only distinguishes speed == SPEED_1000 from speed == SPEED_100/SPEED_10
> while restoring POR values and bringing up the DLL, then passes speed
> straight through.
> 
> So the removed test rejected speeds that are invalid for RGMII, while what
> remains upstream only rejects speeds the core does not recognise at all.
> Are these really the same check?
> 
> A speed above 1000 does appear reachable on an RGMII port through a fixed
> link.  phylink_parse_fixedlink() keeps the requested speed even when it does
> not match the validated supported set:
> 
> 	if (c) {
> 		...
> 	} else {
> 		phylink_warn(pl, "fixed link %s duplex %dMbps not recognised\n",
> 			     pl->link_config.duplex == DUPLEX_FULL ? "full" : "half",
> 			     pl->link_config.speed);
> 	}
> 
> and phylink_get_fixed_state() then hands that speed to mac_link_up() via
> *state = pl->link_config.  With phy-mode = "rgmii" plus
> fixed-link { speed = <2500>; full-duplex; }, does 2500 now reach
> ethqos_rgmii_macro_init() and silently take the non-1000 branches
> (BYPASS_TX_ID_EN set, POS_NEG_DATA_SEL and PROG_SWAP cleared,
> PRG_RCLK_DLY_CODE = 5, RX_PROG_SWAP cleared on pre-GE3 parts) while neither
> MAX_SPD_PRG_2 nor MAX_SPD_PRG_9 is programmed, with the DLL already locked
> by the caller?
> 
> The "Invalid speed %d" dev_err() was the only indication that the RGMII
> configuration is unsupported.  Would it make sense to move the check into
> ethqos_fix_mac_speed_rgmii(), before the POR restore and the DLL
> reset/enable sequence, rather than dropping it?
> 
> For reference, no later patch in this series reinstates a speed check:
> ethqos_fix_mac_speed_rgmii() and ethqos_rgmii_macro_init() still accept any
> speed at the end of the series, and the newly added
> ethqos_rgmii_id_macro_init() is equally unvalidated.
> 
> >  	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
> >  
> >  	if (speed == SPEED_1000) {
> 
> [ ... ]
> 

In my opinion, there's something already very wrong if we have a
fixed-link setup with phy-mode as RGMII and speed anything greater
than 1000. So I am not sure this comment makes sense.

	Ayaan

