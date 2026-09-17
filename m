Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA247C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwwsd9n1Ie2Evql/hn9vxy0s0eRY7/6wy2UffO1bNKo=; b=Jrrw/BQuKWrHjQr41+MJSddCII
	OzrtGrd6eJHWEVhIl+/+7rO4EMiCoDXYXX2bD3VXWAlwnMRXiwywIUKMyX5sq+LmbvAwnlQLU/GzL
	T4XK3nWS03UIizl0jh5CnlUaGKuuJA9NaVnLHJkAAVmerjiLkI/IezPa8sZB0Uv96jKJJ+wUM39Ke
	LYxmab8cRCRiKhsXZqX8YlJGSsbWlfy1eWAJ8VTTl/71O896R2O9OqOCjcVzeNO1wrPnfj9qjYXkm
	qLLApezG90wZ4DHyfRjPpvfVvcDnl6ALj5znDyAZRYN5LXaXw+dA+51hx8xF91Oa5XexwD8LqbwYF
	V1HjbsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FgN-0000000C3pA-0hhc;
	Thu, 17 Sep 2026 17:13:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FgK-0000000C3o5-3OrZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:13:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5DuH3242581
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dwwsd9n1Ie2Evql/hn9vxy0s0eRY7/6wy2UffO1bNKo=; b=KRTjoDGvYXJB7K/x
	f/r06SUdeaALn6zlkn46sCke4cdJvM81SCTy0Rl6LtfqSjE960aKcQdxrkvKxlqj
	uqlyCyRZQwQMQXzxs+PmxO8QnSbJdE4eIBdcb+WdFWx4xIVLIyrkHbZJCcbpfW1u
	a1oNfwkPnajMjJNdv5fM8c2xSA88fz7GYY/vnW8jojl/gWL3oxHKBmAnnbd0Fzfs
	7cpJIb04tsvu9oA0P2InXQUxycpbRrdeQeMJx7G3lIe2S0MDJiMGDIef0xMP1UlI
	v/oZb7LMfz+Jy6BS4rTpFOSI5dAmy2kMq1Zo/Vr0kTbrGvkamdG/DB/48FfvECAq
	SLXYmw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grkcugbnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:13:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1957495a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789665230; x=1790270030; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwwsd9n1Ie2Evql/hn9vxy0s0eRY7/6wy2UffO1bNKo=;
        b=Er9xFVYI51/l2B7AMMFj1vwvPzbVq1Dym0UMTmMJ/W5fiWw9uYJO5a66RhFKxEWC1d
         J4aEm0APVzllmqEigirsbPAcAlWIARNfQs2NmCyssfSn8aYVgaSU4CyxwF6FK9C2qk8O
         lLGI3OwBGqi47E7Ud2A2/m2csZ612+rlR0MLYMcGgCvYU+4aWLZd9eSbSE4d64YYQcS5
         60JrsiLXEarPC8Xcn+NkLkWX3TnBRqIyGTQqFP8xvoJycytBbYTGTwnnPo7835mRWJH3
         Ygv8AGtxIqm4hEYiw3RkNUntSOtdZlO9kSziG/wiE++fxO+OhHhbumszhlBXsMRJuaDw
         FN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665230; x=1790270030;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dwwsd9n1Ie2Evql/hn9vxy0s0eRY7/6wy2UffO1bNKo=;
        b=ge1QkDDPHLzsFGIU9VxYZ8x+yQIvUJGyACCyCOnBQndDA75fWs5pITJ0W1m36S8nZi
         e+DRxYi38qNgB+srZQM5yJ7KfVPlbSj17Y8QGgWMGZH3LYP4/cpna5FtMWU1191W/YsC
         YtnGDyKV3fCboE9YQ9tjbXJeA5Dhg+ZZcSJ4rPsmhXGDjlfNMUx1SwRRo+P6qIxsOTTn
         vKY2aYJOuM3yZfenTkf5CVr1hFBk69yT/44VOcV8noaR7Klyk6mxJoFgrhJRyNkijy1g
         0/9nkqZ3XuqHMbIVnh9V1ppzJ+A3YTDJeNmCCv3AQPnQMraByQRhKX1mDhOPY5CItGlP
         JI9A==
X-Forwarded-Encrypted: i=1; AKwUvBy3o5YwOcnlwN00qQe9LGH6ALhoX+lweiXlwvAsqtVvKafXUF/eqecCoG38CZjd13rVog2V7Xu/DKla5lukLHUg@lists.infradead.org
X-Gm-Message-State: AFuF++m3OKIwBHnF7CWYxzMhdlWzGcykNrxh74G9SFEGigGOxsv2+PXm
	i31xkQ0mqkKbBMfi78DbO0fFIywSEXrJ5lV1j88cKxfHHS72WmtpO0ISzTVq+ctjQthm57oMq8O
	m2VMPaRaMpTJH+4VS8u0VkuuZytk0pWCbsx2BVn9nYx38zle6ddR0RY+znxqElDd1H+MDCHIlpy
	FPcw==
X-Gm-Gg: AYBFou36wralXvQ2I88i0zbCVLufO7krCEPoG1XBO9RhKsyJLmmu2siqLntTKJyoqnH
	c5o7MdJV0tvBZ4ojlV4qzCC52EdmxvQU1f9NfLSHpXCi7yzHV2f2zLm9D+LDhqM0/IkgslRU37B
	xd8I+fhVpvdW3aPooxN/sjynTChJ3cLzVaNqxRUy2qnQq5HC3PgSjIqmZV2Vgnn8FMKj/bdKkWg
	7VEmfWRjPM55afjklO+pUfaGifNIN/taCdlFr97lC0kpylyuA1Kq/4a+WIKz/aFue1devTxHJEM
	l9Tk5eKk7lZXik3JwBf0fTjKYRtA7gn24M3jqDH+X1AS4syWPEDyiMze5QJEp8vfJXl5AoZC30u
	o0Xdjhe4Mxv9CSA==
X-Received: by 2002:a17:90b:4fcf:b0:39d:e54c:a28a with SMTP id 98e67ed59e1d1-39e1e2d7580mr15919842a91.8.1789665229870;
        Thu, 17 Sep 2026 10:13:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4fcf:b0:39d:e54c:a28a with SMTP id 98e67ed59e1d1-39e1e2d7580mr15919812a91.8.1789665229347;
        Thu, 17 Sep 2026 10:13:49 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360ddfc2sm5976254a91.16.2026.09.17.10.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:13:48 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:43:39 +0530
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
Subject: Re: [PATCH net-next v2 7/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Message-ID: <aqwfw2sqhjkKl+7H@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-7-bbe3389d0652@oss.qualcomm.com>
 <178912591910.219967.8208494265030276950@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178912591910.219967.8208494265030276950@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0NSBTYWx0ZWRfX6Miue9qL7k1k
 6rv+3v9vMjWB91CJFCalGGOH9mssNY+n8mgGyAzh0TGzwQEjYgTN7UD7i7VPIgeLK5vvr2DKRWO
 k6i2S8t3wlsUavq68n3prwtTya+/rYI=
X-Authority-Analysis: v=2.4 cv=XttvqlF9 c=1 sm=1 tr=0 ts=6aac1fd0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=WqyH3TuB9VRS23WEE1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: FtCVREjPcJVOGFVIly74D4Xg7U2tSDc5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0NSBTYWx0ZWRfX2nETdFH3aem5
 +/qKkmN6odh9O5sQhgJNl1GYsEoMxSoMEJ7zLkwewZRGgIeNSaMwgpgO5RSRIl/nmANy/fqDv/A
 V0xVtY4zZ0dZtRbCNdEkJVKfHI5koRoNv2I8gJ7GY8AvjJl8Rog4/yR8WU7P5dOSZExaaAaiFu1
 1KCxMqsTnOECoG9grwP4ya9FuhCU3e5bTdtrBa4wEbO5SxZXq0oHVh26vqkC6JTl1p6MZngzRdy
 0XZl1204etX27Cf9uLV09N3sCTS8XlpbxCLBW8YTUMl9/E4BIVQ5bqUGA1JHJylTaMzpS2HYbct
 pUtiNR95e5zebYrmJVndMRuHurzGoQLOg41RIZ2bJZD3ynUcnyZ8z1FkXtimJDplsFPwkvao6EO
 sgTfSfWCKSp40cYAqa3GQE2+pc/S26fkUxPdk36rw1gw6/8oAXAOf3MIfPirrA+Cq/tQ1+9ZFK/
 mWw9lK51YbQ02Sajcng==
X-Proofpoint-GUID: FtCVREjPcJVOGFVIly74D4Xg7U2tSDc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_101356_864702_97EF3415 
X-CRM114-Status: GOOD (  35.29  )
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

On Fri, Sep 11, 2026 at 11:25:19AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> - [Medium] For legacy RGMII phy-modes (rgmii, rgmii-rxid, rgmii-txid) the
>   RGMII IO-macro DLL is programmed and its lock polled inside…
> - [Low] Commit message names the wrong callback: it states "fix_mac_speed
>   updates the rate once a link is established", but neither…
> 
> --
> 
> net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
> 
> The probe-time call to ethqos_set_clk_tx_rate() is changed from SPEED_1000
> to SPEED_10 so the RGMII link clock is not left at 250 MHz while no link is
> up.  Two questions below, one about the changelog wording and one about the
> first link-up path.
> 
> > net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
> >
> > On probe the RGMII link clock is initialised at SPEED_1000, which
> > translates to a 250 MHz source clock even when no PHY link is present,
> > drawing unnecessary power.
> >
> > Initialise at SPEED_10 instead; fix_mac_speed updates the rate once
> > a link is established.
> 
> [Severity: Low]
> Is "fix_mac_speed updates the rate once a link is established" the right
> callback name here?  Neither ethqos_fix_mac_speed_rgmii() nor
> ethqos_fix_mac_speed_sgmii() calls clk_set_rate() on ethqos->link_clk; the
> only clk_set_rate(ethqos->link_clk, ...) in the file is in
> ethqos_set_clk_tx_rate(), which probe installs as
> plat_dat->set_clk_tx_rate.
> 
> stmmac_mac_link_up() invokes the two as separate callbacks, fix_mac_speed()
> first and set_clk_tx_rate() later:
> 
> 	if (priv->plat->fix_mac_speed)
> 		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
> 					  speed, mode);
> 	...
> 	if (priv->plat->set_clk_tx_rate) {
> 		ret = priv->plat->set_clk_tx_rate(priv->plat->bsp_priv,
> 						priv->plat->clk_tx_i,
> 						interface, speed);
> 
> Could the changelog name set_clk_tx_rate instead, so the ordering is not
> hidden?

Ack, the commit message can mention set_clk_tx_rate instead of
fix_mac_speed.

> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index a92bf4a6a2dbd..2471871562ed9 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -814,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> >  				     "Failed to get serdes phy\n");
> >  
> >  	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
> > -			       SPEED_1000);
> > +			       SPEED_10);
> 
> [Severity: Medium]
> Does the first 1000 Mbps link-up now run the SDCC DLL bring-up with the
> probe-time 10 Mbps clock rate?
> 
> For the legacy rgmii / rgmii-rxid / rgmii-txid modes,
> ethqos_fix_mac_speed_rgmii() enables the DLL and polls for lock:
> 
> 	if (speed != SPEED_100 && speed != SPEED_10) {
> 		/* Set DLL_EN */
> 		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN,
> 			      SDCC_HC_REG_DLL_CONFIG);
> 		...
> 		/* wait for DLL LOCK */
> 		if (read_poll_timeout_atomic(rgmii_readl, val,
> 					     val & SDC4_STATUS_DLL_LOCK,
> 					     1000, 1000000, true,
> 					     ethqos, SDC4_STATUS))
> 			dev_err(dev, "Timeout while waiting for DLL lock\n");
> 	}
> 
> and stmmac_mac_link_up() calls fix_mac_speed() before set_clk_tx_rate(), so
> at that point ethqos->link_clk is still at the rate programmed at probe.
> With SPEED_10 that is rgmii_clock(SPEED_10) = 2500000, doubled to 5 MHz for
> the non-rgmii-id modes by ethqos_set_clk_tx_rate(), where it used to be
> 250 MHz:
> 
> 	/* Clock Rate Requirements:
> 	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
> 	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
> 	 */
> 
> If the DLL cannot lock at that input rate, the poll busy-waits its full 1 s
> budget in the link-up path and then continues with an unlocked DLL, since
> fix_mac_speed() is not re-run after set_clk_tx_rate() raises the rate to
> 250 MHz.
> 
> Note the driver itself skips the DLL enable/lock for SPEED_10 and
> SPEED_100, which suggests the block is expected to see the rate matching
> the negotiated speed.  Is a minimum DLL input frequency involved here, and
> if so should the probe-time rate stay high, or should the clock be raised
> before fix_mac_speed() runs?
> 

From what I have seen, the clock rate does not affect the DLL lock. Even
in the existing code, a switch between speeds would end up attempting
the DLL lock at the old speed's clock rate while the new clock rate gets
set later on.

	Ayaan

