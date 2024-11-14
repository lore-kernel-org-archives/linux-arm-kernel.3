Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94656D637D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 02:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbULr184rMs+0hKlTM2ECCrFBMN99AVDTkJ+fZktbaI=; b=YK63CQ1+0vNBm7lYPkNrNVOAf0
	kEcznhuM+2m3KK8rZ0bdXDs/kPhy8M0buAHv4EiJ+XN5Bwn0eXXDB4oJfXVRQt8PIi5Av88zReTMv
	lSyrDT4CofDsF/sLiPx2Ehz9NG7WlADmIE2vVtKwUn/zK7PH65l101HJ7pBuH0UpMsn1CQWPvcBqG
	lgG+Bz3JLk9y+dvbHMAZBoOdJDK1oZdh7C9WYFvmQOCH7+FHskMwxFVgsy32rBMfjM7wW0XUT7jHL
	+IGgjHFs9s7hLkc5kjuV4DwW/stvXEuUKV7LDANnwg4RUZDd5yZTFHhv1Akc/9bqvguAxotgpbexq
	XmQzRysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQ2G-00000008cSr-1rOJ;
	Thu, 14 Nov 2024 02:56:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPxf-00000008bbh-2nJl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 02:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NbULr184rMs+0hKlTM2ECCrFBMN99AVDTkJ+fZktbaI=; b=OCovBEA9AdJJE0UpG1FQFiVk0q
	yb+h8evRMeH7xPTRSYHLwBSkNzJdKZ69WHNTaNzKlqixO7VOnFGIhB8f9g194MRZ6sMXERgoFOJag
	nWlSKhsWCec8Zg9tctPTkBCsrJGdQbvw2hQg9byF8f4cKoraAxrGX1TWP+s+Y2B28NMk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tBPxT-00DEkT-1w; Thu, 14 Nov 2024 03:51:47 +0100
Date: Thu, 14 Nov 2024 03:51:47 +0100
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
Message-ID: <55914c2a-95d8-4c40-a3ea-dfa6b2aeb1dd@lunn.ch>
References: <20241112-fix_qcom_ethqos_to_support_xgmac-v1-1-f0c93b27f9b2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-fix_qcom_ethqos_to_support_xgmac-v1-1-f0c93b27f9b2@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_185159_724685_D9CBED9A 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 12, 2024 at 06:08:10PM -0800, Sagar Cheluvegowda wrote:
> All Qualcomm platforms have only supported EMAC version 4 until
> now whereas in future we will also be supporting XGMAC version
> which has higher capabilities than its peer. As both has_gmac4
> and has_xgmac fields cannot co-exist, make sure to disable the
> former flag when has_xgmac  is enabled.

If you say they are mutually exclusive, how can it happen that both
are enabled?

To me, this feels like you are papering over a bug somewhere else.

	Andrew

