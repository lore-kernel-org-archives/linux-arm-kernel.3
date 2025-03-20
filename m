Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A689C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 22:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMPcFOn4UwYXter5dbI+9cINmWX56V1KwEkN69pNmGE=; b=qaBFR5AGVSs0K+qxRz2NpN3qI9
	vRTH3pgGW9v1rFY+3rvD+ZgbxwGr9bgM9Hiqcl8S6uaiZTc+g/N4U1zcqHG2/XhBR9NWY16xJE/jv
	RZrZNzgNPLVJbZRbXDnuabB0wx2p7v2EJGC4xACC+YsiAqZFCkVg5A7FuCY4F3Nyazj5cAwteLtQa
	xf41r+GX9df8/TvL9igHKTASLqc9VAuJSuV80AcGfPjdKZ1ppjNrYtF1KEesV09YuHlSIbvQVmw+F
	iglDF5dY77yYAHbNmzq51eNyVQ3kAaBU3e7ZOYlkHtPY4BMSIoefYrfuWAgc6lrXWn6khj+sFCNYb
	nOI8NooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOJI-0000000DM9r-0QTb;
	Thu, 20 Mar 2025 22:24:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvO8S-0000000DKkY-2gI7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 22:13:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E00FF6159E;
	Thu, 20 Mar 2025 22:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B68C4CEDD;
	Thu, 20 Mar 2025 22:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742508787;
	bh=M7qrseV6fB8Hed0ymLja/KLmZm6erUG8Gh3U6YrkLzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IUOSq3feRUEOLLgSW7vUdrZ3wJPw87ZS4Toe3mUkTuhPH5XGp5YVvt9gMvIKPX1kf
	 YB7nJQHtbQ5nu9G55CeNT0kxzrAPHXQc6s5EhvFJ1gz2Kkh1uUBY/OTAN2uMsOj8/D
	 idKvcye6uePTP1C5zBx7UOvTb7aTTKcUFX0H+2gb9MvfDN0ybup9S0jlbU1OwxxALL
	 QxHt8OlRrBIWUsskCpfVvS/58obwwGLzRf5ks1sVtktni2nzjB/oOZg0xuKogerK2w
	 bbBC6i+/gQDKT154qksc8V0s86kNMrgFIUxyzzt94+lXxqcL5qzaaya7EV/tYeUcQn
	 3ufYvYPor93WQ==
Date: Thu, 20 Mar 2025 23:13:03 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Brendan Higgins <brendanhiggins@google.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Rob Herring <robh+dt@kernel.org>, Rayn Chen <rayn_chen@aspeedtech.com>, 
	Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai@quantatw.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] aspeed: i2c: add clock duty cycle property
Message-ID: <jcznjekoig6n5jtispbgxn6ingzteodwb5lib77evsvvufldoh@ia57mjlvie5k>
References: <20220610054722.32229-1-potin.lai.pt@gmail.com>
 <20220610054722.32229-2-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610054722.32229-2-potin.lai.pt@gmail.com>
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

Hi Potin,

On Fri, Jun 10, 2022 at 01:47:21PM +0800, Potin Lai wrote:
> Introduce i2c-clk-high-min-percent property for setting a minimum clock
> high percentage.
> 
> This driver calculate clk_high and clk_low with giving duty cycle. If it
> could not find a suit clk_high and clk_low, it apply default duty cycle
> 50%.
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

if you have still interest in getting this patch applied, may I
ask you to please resubmit it?

Thanks,
Andi

