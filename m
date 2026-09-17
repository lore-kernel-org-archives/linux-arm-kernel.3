Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0337C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnkjcGuQVl1beS4tDUCJl3BOauM32z7nrFMjHCzwJSw=; b=MUpBSOGVdbTBUKYFlcwrNwkeCv
	0MrphgVk5LCNIYUWnZ5u7gpJFVvpRJ4pou6Uq2AuYi6J0b28MXiGYkNOkLKR5qQOd8pz7wnDwXsAa
	Rnc3t4YsW1PBRafmuRgR8T0ZzY9/TXpyDpqkOj01uWPextKO8z18OPE/fuRfWfa9Omwkxh5uiZiii
	QXOU93EcOqohmk+y+ntz/OgVHPToxSMPXsu0mKZiw8Zz4tioX6bVOZzxK7lgEZLkWQNa/F3tjyChy
	cxwZjr/RqD60rFdB7VDAvSMrxU8PyDc0ZdI+mOd1WES+jFoeKzkZzb4xDs9Ct+04B3Cv3uMCXN5LP
	gPPpVsmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FaN-0000000C2vE-1leB;
	Thu, 17 Sep 2026 17:07:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FaJ-0000000C2sr-3ZqB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:07:45 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5k7T2728648
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OnkjcGuQVl1beS4tDUCJl3BOauM32z7nrFMjHCzwJSw=; b=hpXxIIZoB3SeMm//
	wdqx6jjYrY+WFvIEVZCHerJpf8TulhvSoXC1qJ1RNO4Vs+T+kd+j7ueYnEV1tu88
	50Z21zY6iq3H+iM6BmTl1khcXxe9Aw1fsBWHRBnNs7vUIyNaH8Na1DZtsHbUIqSy
	MX7hWrcr9IoAFPCVhw4waDj/PdRfMOxXHWBH6J5g9f2YdNJYNzxkXLN1NGXpjq/N
	ejbxDnlbCgidIMBcsYnl6rThYPdYWqefeT8EnDoqtlBYz2rBU2FKvrhS0zT1k6Jm
	45pkdzom3g1PSTBOSgao6jgFGb0K1yuMuuSZSv5hppiREk/mdNUuZYgbQCLRX7e3
	quakzQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfpphh1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:07:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd7d0751efso12709245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789664862; x=1790269662; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OnkjcGuQVl1beS4tDUCJl3BOauM32z7nrFMjHCzwJSw=;
        b=Z/l9Jf9mwqH2qWbXjzcATG5JBfe0n6XzxS4c0Gc5EFScUBgtfn1+lW1cKNJUKlbWI+
         AM0l51cqkcxN1CvV3msw7qEQmTBi5nvTpj6FX+XdFOddRdlFXAwBa+tpHIjj8VNH3uhn
         fWSqZP1PjCH8ewAIxuIsmFoeVaq5yhrRV79tbGzhm5cUFQ8cnKjz6HaN2Zmu/erTv6/c
         cbqgOc7rcOsFa3zl2x/S4nWhFic/BC9z6y2mTos6iaSFtujWX6Sgc7j0eYmuvxWd7sbf
         r0yU1v/5iO2dnCmr7hfKI6dGj1DDqgTscPAOq4Lcnlph3bPYruVq+4qrBBOqyxfu53ho
         +sPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664862; x=1790269662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OnkjcGuQVl1beS4tDUCJl3BOauM32z7nrFMjHCzwJSw=;
        b=pPySvv2ztJma4OgLwdq0T8sUiL/SpNOX7JhFCYs9FCyl53sPCeCPZ9Meo5SGLRyebH
         dU7eV8AbH+wa9UsqKp2l0JuTFTqqWsm7rPlbttQDMC4UiwdMktX7gd+VA4vbI95MhdLM
         hnm2/FDJf5PMLbvTueibE5h2RdY0cLJ425/tK2hS9BFAxeH90FXCBW85BnP28tYzIQrv
         MJwdA34ECz3GPAj114ejPYLp/Gkx6B5UIvbizZE5Dvz5ny4YsH71XLAdDdIy9SHRlt+J
         GXKuZNxg6Y5fQeFGgyn7ogq9mm7gwX46yDlOTI4cJT64LR5gURnrEcdsDXjdmQWFnLkk
         yc/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFMV0K2cPJwh9o+QqbD0zOOJ9Gz+vNKDWrv1lhzQZNMRd8mY9UUobNOvQXgii7gSFrbiYhi2t9ztu7InqqOBFM@lists.infradead.org
X-Gm-Message-State: AFuF++mAlH8EYp9Wt9UdTHQPiabF3KPaMYW6l5cSuMy0RiK0QNi5Ne3o
	mG7z0pU6QKwfuWGyJWki3u5uZphfqnYabcB/+3wMn40WUdNa2nEQsDw9mxu2IomfRujfc8WYtii
	3l2NklfMV8+ciDnnb3Y2Csfho7GTU4O5I1syPFLVFaHcYrt6XK/z1o1/O7gdybTXusBsIxgGscJ
	R3QA==
X-Gm-Gg: AYBFou2BcKoktaVnEQQfgThMM3IcE8mgm1rOYZhARtYPTlDkVfEP5t6TdC7wnMxK1/U
	1BG7X5VWRNGVnQYFNM06fxYkh3hp+4TjMQRUvGndMzFgIRlJNMH01UnMyi7GMGG95gdPAgiZz5q
	NeLHLi1N76WDaRGOxzVQeHIqWC4KEgdHexi/uZWxObfiCG7HWtyjY7QFQIrON8iP+ZLbcIRpVzb
	0Xr1NQIQlba8dOyoIkPuh0QQZH+Ch3Tzu3LGjsicYTG+iG05NaEIFoWSDAY2Fu/LZqXnVmF2ETh
	l/Y3hXw6fmWDYEZlscR0kfyGIaP/pDZ6BFP5gsUJjKf73u7vMEUAWxeUHzNLjMqL0n18pArhCk3
	Ual+R/oBTJElwog==
X-Received: by 2002:a17:903:11c3:b0:2dd:ad7d:72e3 with SMTP id d9443c01a7336-2ddad7d74femr10397545ad.26.1789664861541;
        Thu, 17 Sep 2026 10:07:41 -0700 (PDT)
X-Received: by 2002:a17:903:11c3:b0:2dd:ad7d:72e3 with SMTP id d9443c01a7336-2ddad7d74femr10397255ad.26.1789664860991;
        Thu, 17 Sep 2026 10:07:40 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8e6a3sm30492845ad.7.2026.09.17.10.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:07:40 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:37:31 +0530
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
Subject: Re: [PATCH net-next v2 5/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
Message-ID: <aqweU+PCLaXi0fLh@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-5-bbe3389d0652@oss.qualcomm.com>
 <178912591493.219967.8863321460780410702@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178912591493.219967.8863321460780410702@kernel.org>
X-Proofpoint-GUID: mWUrWZENRK4h0qXmI15K6Wvp6bvIgtox
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac1e5e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=vOTgahw99eS1XjnIhgcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: mWUrWZENRK4h0qXmI15K6Wvp6bvIgtox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfXy56kwyUXVeEp
 2UAWKSLsmyEVqXgV8Xn8CnnzdmaKtch/c7hA/qHFF8mhWyzfE+wwi4NrlIY5PscdieKHMHAHqRL
 AL54VztY38C7U/ogckXJs5KEUZdhketbKOZA+WTinfChV3w2vb88sTJhGY8NUeDVk5wsQjrcR5J
 BZ47wjjf8tqkE0sI17BlO6Gls2YxMZs/3zBEZ03D1G2NJ98GUprN4OWhEtWcilOd1fLtv+NJ7IF
 m1NaVeQurztWzfwwtoKHvHx0/nH/gBI7q/yQvKwJgR3qyukCNeyiHR+WF6TeXoJGbyOR8WFt541
 Kgc5Cytf72/sLu53jlyV7pahIKTLiw6u3ao3GhiRfzklHJRtxAI1BnTWJZ7KFHvSskJw4a/I5kO
 PaaBd72TmXG3O5CeSBfoX5kct1kohxJh/FuQfeLdW81a2d018Rw+T+fpHj1oza/0v5A+DAkvmv5
 whDOcC00mEcQSc3EhKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfX0kkpPupokS6i
 SGjPL9zM7EHSQDvK3cl71fqhtaZR7uoH1yHootQSfd+9Ob3BRtD618F2+lj8q5qwGrb3Uz9nJ8i
 HivTYsuiAwcKhTfsic6BU3qUOgU55Wk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_100744_041774_5EB07313 
X-CRM114-Status: GOOD (  35.57  )
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

On Fri, Sep 11, 2026 at 11:25:14AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] The patch is worded as a bug fix ("fix RGMII_ID mode to use
>   DLL bypass", "Also fix ethqos_set_clk_tx_rate()") for two user-visible…
> 
> --
> 
> net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
> 
> For phy-mode = "rgmii-id" the driver now powers down the DLL, sets DDR
> bypass and programs the IO_MACRO through a new
> ethqos_rgmii_id_macro_init() helper instead of running the generic DLL
> init.  It also stops doubling the link clock rate at 100M/10M in that
> mode, and drops RGMII_ID from the TX phase-shift suppression in
> ethqos_rgmii_macro_init().
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 44270c25d874f..53fb9de4d92c7 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> 
> [ ... ]
> 
> > @@ -183,7 +186,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> >  	if (rate < 0)
> >  		return rate;
> >  
> > -	return clk_set_rate(ethqos->link_clk, rate * 2);
> > +	/* Clock Rate Requirements:
> > +	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
> > +	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
> > +	 */
> > +	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
> > +	    speed == SPEED_1000)
> > +		rate *= 2;
> > +
> > +	return clk_set_rate(ethqos->link_clk, rate);
> >  }
> 
> [ ... ]
> 
> > @@ -493,6 +539,21 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
> >  
> >  	ethqos_set_func_clk_en(ethqos);
> >  
> > +	/* For rgmii-id mode, the PHY should add the required delays.
> > +	 * Therefore, power down the DLL and program it in bypass mode.
> > +	 * Program the IO_MACRO as per the settings recommended by the
> > +	 * programming guide for bypass mode. This will ensure that the
> > +	 * MAC core doesn't add any additional delays.
> > +	 */
> > +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
> > +		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
> > +		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
> > +
> > +		ethqos_rgmii_id_macro_init(ethqos, speed);
> > +
> > +		return;
> > +	}
> > +
> 
> [Severity: Medium]
> The changelog describes this as two functional corrections, "fix RGMII_ID
> mode to use DLL bypass" and "Also fix ethqos_set_clk_tx_rate() to not
> double the clock rate in bypass mode at 100M/10M", but there is no Fixes:
> tag.  Should one be added?
> 
> Both defects look reachable before this patch.  qcom_ethqos_probe() accepts
> PHY_INTERFACE_MODE_RGMII_ID and installs the affected callback:
> 
> 	case PHY_INTERFACE_MODE_RGMII_ID:
> 	case PHY_INTERFACE_MODE_RGMII_RXID:
> 	case PHY_INTERFACE_MODE_RGMII_TXID:
> 		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
> 
> so an rgmii-id link previously ran the full DLL init and had the RX delay
> programmed by ethqos_rgmii_macro_init() through
> SDCC_DDR_CONFIG_PRG_RCLK_DLY / SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY, and also
> got rate * 2 from ethqos_set_clk_tx_rate().
> 
> The partial mitigation for the TX side came in with 164a9ebe9742 ("net:
> stmmac: dwmac-qcom-ethqos: Respect phy-mode and TX delay"), which only
> suppressed RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN and left the RX delay and
> the doubled rate in place.  Would that commit, or the original driver
> commit, be the right Fixes: target here?
> 
> Related question: which platform reproduces the misprogramming, and on
> which hardware was the new bypass register sequence in
> ethqos_rgmii_id_macro_init() validated?  Grepping arch/arm64/boot/dts/qcom
> turns up no ethqos node using phy-mode = "rgmii-id" (only sa8540p-ride.dts,
> which uses "rgmii-txid"), so it is hard to tell from the changelog who is
> affected and what the backport risk is.  Could that be stated in the commit
> message?
> 

Since there are no current ethqos users of "rgmii-id", nothing is really
broken in the current tree, so a Fixes: tag might not be required.

	Ayaan

