Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB34E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMuu6bJis9IWn2H5hy1OtYsEctzOGGKn5LuVR8Iv5j8=; b=hJ1dXW0eZkt3eF05G6KeTkd4T6
	JLYUEP5rZxRGAZvFSeGC/Eiy/ptxqT2yS9Q63zobZduNS9UGk6Dh7Q5Zi6ws7xGChNhGc8VF4mXpC
	ddNEvW2W67ALQvZ0Vsjh7iF2TPG8mn+EAXMxgZrV14H5rM6qBSxQVjm9BssQaZljHZD4S9WNPvzln
	AZXLX5Sr1gDlkuBiPCwGtF4us/nHotrf5z0W993vLZqRXeJBwRa7tQpXxKt6T86JSkG+IXRr3BKec
	mP0F3HmQIcEq/FLKqx9+Y2x/5eJuPhHf2PmspXs/Hy9KTetxMEvqm4syGfF5rezUZG983soYFvatT
	7WBBVFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRuT-0000000FoMk-1Pnj;
	Wed, 11 Dec 2024 18:58:09 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRrA-0000000Fmrd-0y5J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 18:54:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2EF040005
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 18:54:38 +0000 (UTC)
Message-ID: <9e6f04e1-26d2-4dbb-ab34-da39d4fee739@korsgaard.com>
Date: Wed, 11 Dec 2024 19:54:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] ARM: zynq: Replace 'io-standard' with
 'power-source' property
To: linux-arm-kernel@lists.infradead.org
References: <cover.1733920873.git.michal.simek@amd.com>
 <cf45ed95fe0be083446d5aaf5f946f38acba7728.1733920873.git.michal.simek@amd.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <cf45ed95fe0be083446d5aaf5f946f38acba7728.1733920873.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: peter@korsgaard.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_105444_401867_E57469EF 
X-CRM114-Status: UNSURE (   7.74  )
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

On 12/11/24 13:41, Michal Simek wrote:
> From: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> 
> Replace 'io-standard' property with 'power-source' property in all
> zynq dts files to be in sync with Zynq Pinctrl driver.
> 
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

>   			slew-rate = <0>;
> -			io-standard = <1>;
> +			power-source = <1>;

It would be nice to replace those magic numbers with the corresponding 
IO_STANDARD_* defines for readability.

-- 
Bye, Peter Korsgaard


