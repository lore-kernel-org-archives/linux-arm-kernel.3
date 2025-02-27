Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52007C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odRe86wbBsQkcjq+MlDDcHZ1ydHEZEkP/u4cZxHpKl8=; b=CXuwz4oFjJI1XEp0jnXFndyXLO
	WXrmi7sFB6DotTeVc1pyZaHD4aDGaGmmzN0jLqyBE4haBVhQCGNi4MEYgw477rcvTVST+CbiqDOiT
	ygEYl1pQ+dGkUXnMPbr37m3uLlTOzOI5T9kLObmQsfPbGgDjQCR5PO2M9zSKYRaC//8jDrQByAaQ6
	em8JAcwCr7FCe84XuOMkPc7lCCZultFgjbPqYzPwt8xloHXOWQbcwYcC+6ttH4Vawf/0WAtracL4f
	tOafOr77rv2IYPsnd4L0CxBNCkcM8Qv6Y8+y1rfX05ImLVLdOpd0vXzqQz0HtaWjaaZtkhnDBOTiO
	jl2NJN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf1n-00000007lZq-3fE2;
	Thu, 27 Feb 2025 14:38:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tndmi-00000007UnG-2ymU;
	Thu, 27 Feb 2025 13:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=odRe86wbBsQkcjq+MlDDcHZ1ydHEZEkP/u4cZxHpKl8=; b=I/ckulVENplgJLCSPkpinMhiHF
	cya+hcSVQSocal22jUocKva6Y3YPPggHj7N8rUMd6sxpwPiQysYVQV4QX9YftUu9UwxqVX/+7yCNZ
	h9Ey4lCbqJOfcVi1d/L6Pz4jKJBTnQ3j7pGN7HDT5e3kB8wsPqwtK9JJdCGkNYuUr1xY2MUBAPW6A
	zmsr6Qh1i6iT1iog0K00WDYJmA8LtkJdEEG4a25Mt0yFwo0Z/F+GnNl/7AmJK6pv0ZpQR9xKNHOPn
	Hd8DfmcCmhPB7AXbHCsRyIy1gyD5m/K2nFDz9iR9mIHev3WHc/CBz9/jxvbpPvAu6h1EkEvFCI9Jj
	v1KAeXGg==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tndmV-00012t-UU; Thu, 27 Feb 2025 14:18:27 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-pm@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 2/2] soc: rockchip: power-domain: add power domain support for
 rk3562
Date: Thu, 27 Feb 2025 14:18:27 +0100
Message-ID: <3210955.TQGk6oTFT5@diego>
In-Reply-To: <20250227105957.2341107-3-kever.yang@rock-chips.com>
References: <20250227105957.2341107-1-kever.yang@rock-chips.com>
 <20250227105957.2341107-3-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_051840_749573_72B5D1DB 
X-CRM114-Status: GOOD (  10.05  )
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

Am Donnerstag, 27. Februar 2025, 11:59:57 MEZ schrieb Kever Yang:
> This driver is modified to support RK3562 SoC.
> Add support to ungate clk.
> Add support to shut down memory for rk3562.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

After the move to the pmdomains subsystem patch subject should be
	pmdomain: rockchip: add power domain support for rk3562

with that change
Reviewed-by: Heiko Stuebner <heiko@sntech.de>



