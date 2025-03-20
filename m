Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCC8C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0Ivq67bbotH4ADjJAlFztdw/IUYFM+eBRURP7U+L1E=; b=Snu98hl6WXgoCaz1vg4/DBpUQA
	w9HbGltgGPXe/cOnPIRexTVE7n8K490AoCvpi2hrb11+LfwaNTEseJ8+hALe37FK4zIDPsyCd/xu/
	cZ/804UhBrVniSEcIDi39ngDfDPp64yEly9qzA4v7M/ty6HWs0UjzYqN8wHNYtYufo5vCXrFMqSLi
	SbNgk/l8J99MYgERDJG5s9rFCrHBx+/oniChif6xrdCdo/O+MhuKFm9d5DpgzU2zLWJ2Ec/doCjqv
	q3Eya446QxMTjxR2017WIaxXgHVz1xCys+63Qg84rHSTwuTGCuIiHmfH6ifhpvpkr83JNLscyDx4C
	SGz+uKKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJCc-0000000CjxW-3N2l;
	Thu, 20 Mar 2025 16:57:06 +0000
Received: from [156.67.10.101] (helo=vps0.lunn.ch)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJAu-0000000Cjkn-344U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 16:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=P0Ivq67bbotH4ADjJAlFztdw/IUYFM+eBRURP7U+L1E=; b=MlEEVOaiCDs90bRztnCdRaJ8ow
	OK0zmlKkUw3+EaeajJmdoGHTn6Kq3ENk0vEmbsBu+0tX/1xvNzVUS4OfrbQ/lz1HOWHzvSZG+q1oq
	mDXmR2Jb9BJrw+qDVUbZqkMolVWFZq7SpGAwiRLh7lfbtwfMzApi/DHu41/+eiJ3NXxY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvJAZ-006V1c-OP; Thu, 20 Mar 2025 17:54:59 +0100
Date: Thu, 20 Mar 2025 17:54:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Willie Thai <wthai@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, kees@kernel.org,
	tony.luck@intel.com, gpiccoli@igalia.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, openbmc@lists.ozlabs.org,
	leohu@nvidia.com, tingkaic@nvidia.com, dkodihalli@nvidia.com,
	Mars Yang <maryang@nvidia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH v3 1/2] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200NVL BMC
Message-ID: <fbf6a89b-80c4-47f3-9dad-2725c040e041@lunn.ch>
References: <20250320164633.101331-1-wthai@nvidia.com>
 <20250320164633.101331-2-wthai@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320164633.101331-2-wthai@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_095520_766007_35E52FA5 
X-CRM114-Status: UNSURE (   5.78  )
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

>   - Skip mac setting and wait till the delay issue in phy-mode fix from Aspeed SOC vendor side [Andrew]

For this part only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

