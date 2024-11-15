Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F55DD6DDFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ef3SzHkC/AAEf+p5zTM3KCa1I619LTyjflgp5vpLoF4=; b=uRcoWOIw++H150S+ijs4hQ7xsX
	2iUFcrsTzsMjUt0Y3Xs7VG0h6WfFhsbzXBDOhOcQhwa1pKp9liQDDDq9nY7z9qCq6KfgJBHc2BDfE
	kRc7O+kGqTl5P4aO9FN+IgChI1om0ZW0kWGqs2NoZe0/970PHF+bVv0BNbjwPtTyu7M9lYDI90Yj2
	w2UPyxis4mkKFZQSlA0tWhidjXam/nW0WKpE4hxLOsgwyqr5xNZCSZ7BLY6Vhy1WRrL+8z2RhVvJJ
	bTDYmqtN+iDDJPF/mwOTPtGn5SuvfIQBRM9BKaV55sN+l+3xER6kuNbHjeyOOHKT3ujimkoC1celM
	M7/3d6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwIe-00000002mds-26Oj;
	Fri, 15 Nov 2024 13:23:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwHi-00000002mPx-3JEe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 13:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ef3SzHkC/AAEf+p5zTM3KCa1I619LTyjflgp5vpLoF4=; b=kuS9SzL/3MNLaDLbckp5u18ELV
	TC/iDCSgoIsrmkllG4TQsJA8fMVq1f5M0UQpUg7sxxQ6138WVDYLd/ird8R+uvzoojnz1GKmjrw43
	M2aKNrxrwjjoLFw8OyfhJZ+u8pctVsw8ZDkz38yqYQu3xTw82qBqS9dj9HNHDgJv+6KM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tBwHM-00DQ7l-NL; Fri, 15 Nov 2024 14:22:28 +0100
Date: Fri, 15 Nov 2024 14:22:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable support for XGMAC
Message-ID: <5899239a-50c4-46ca-9cd7-43e95d61fe54@lunn.ch>
References: <20241112-fix_qcom_ethqos_to_support_xgmac-v1-1-f0c93b27f9b2@quicinc.com>
 <55914c2a-95d8-4c40-a3ea-dfa6b2aeb1dd@lunn.ch>
 <2ac308d7-35be-463e-9838-3bbedc2a4d68@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ac308d7-35be-463e-9838-3bbedc2a4d68@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_052250_826420_2B59B637 
X-CRM114-Status: GOOD (  22.58  )
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

On Thu, Nov 14, 2024 at 05:08:13PM -0800, Sagar Cheluvegowda wrote:
> 
> 
> On 11/13/2024 6:51 PM, Andrew Lunn wrote:
> > On Tue, Nov 12, 2024 at 06:08:10PM -0800, Sagar Cheluvegowda wrote:
> >> All Qualcomm platforms have only supported EMAC version 4 until
> >> now whereas in future we will also be supporting XGMAC version
> >> which has higher capabilities than its peer. As both has_gmac4
> >> and has_xgmac fields cannot co-exist, make sure to disable the
> >> former flag when has_xgmac  is enabled.
> > 
> > If you say they are mutually exclusive, how can it happen that both
> > are enabled?
> > 
> > To me, this feels like you are papering over a bug somewhere else.
> > 
> > 	Andrew
> 
> 
> We can set either has_gmac4 or has_xgmac flags by using below
> dtsi properties as well. But since Qualcomm only supported
> GMAC4 version in all of its chipsets until now, we had enabled
> has_gmac4 flag by default within dwmac_qcom_ethqos.c instead
> of adding any of the below entries in the dtsi. But this will
> create problem for us as we start supporting Xgmac version
> in the future, so we are trying to add this change so that
> our driver can support Xgmac version when "snps,dwxgmac" is 
> defined in the dtsi and we are keeping the default supported
> configuration as gmac4.

So i think you are saying that stmmac_probe_config_dt() does not
reliably set

	plat->has_gmac4 = 1;

or

	plat->has_xgmac = 1;

because you have not listed the secondary compatibles:

"snps,dwmac-4.00"
"snps,dwmac-4.10a"
"snps,dwmac-4.20a"
"snps,dwmac-5.10a"
"snps,dwmac-5.20"
"snps,dwxgmac"

in your .dtsi files.

It is too late to add these, because of backwards compatibility to old
DT blobs.

However, you are thinking of doing it correctly for new SoCs, and
include "snps,dwxgmac", so stmmac_probe_config_dt() will set
plat->has_xgmac = 1. The hard coded plat_dat->has_gmac4 = 1 then gives
you problems.

Correct?

An explanation like this needs to be added to the commit message
however you solve it in the end, because your current commit message
does not explain the problem you are trying to solve.

You already have:

struct ethqos_emac_driver_data {
        const struct ethqos_emac_por *por;
        unsigned int num_por;
        bool rgmii_config_loopback_en;
        bool has_emac_ge_3;
        const char *link_clk_name;
        bool has_integrated_pcs;
        u32 dma_addr_width;
        struct dwmac4_addrs dwmac4_addrs;
        bool needs_sgmii_loopback;
};

static const struct of_device_id qcom_ethqos_match[] = {
        { .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
        { .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
        { .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
        { .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
        { }
};

This has has_emac_ge_3. I think it is much cleaner to add has_gmac4
and has_xgmac to ethqos_emac_driver_data, so you have a clear link to
the compatible.

	Andrew

