Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04793106288A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kc2QGWF5G5EzUjXMEaPPTzIZ3WpACKsHXW+pHWvE/HI=; b=jMFJV2N5cVuX9Vvs0m8fONUHPb
	9+th+Q4M9rXV6WtWEF2imHGK+XYY+CPFrMgzy2VkT8nFdyz+DOg/vvU4DEbFX7LsUPk+Xvn+w8FbY
	3qK7/y/L1aMCW7jd7iDyuVemKLQoBgYkg6Yeiz8YZ5e6Sf7H9MsBe+u1SKZxpB5/cDfU2zUPKc+fV
	FJnb35Y+v4m2UDFa5we7n2tsnQ2lpzLtIsY2Rm5zrBqTvcYDNsZ98drxCdbZu0RIxm9FZBqhyt3HB
	cshgtZ5fK5MY6ZbXPHAmo3FzL1nHPncaBK4K7W1HyoE+rtF6YoVDzjPhYpdjNwy9iaM26jpU38RrP
	ie9sI7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IgB-0000000BYsY-3iGj;
	Wed, 11 Mar 2026 12:28:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IgA-0000000BYsA-3IRB;
	Wed, 11 Mar 2026 12:28:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F42B60145;
	Wed, 11 Mar 2026 12:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E196C4CEF7;
	Wed, 11 Mar 2026 12:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773232125;
	bh=WuY0INtBXp4bdO1U7Nbe5xqaanpsrysVxQk4S6c9FJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzdROzh4Rp4Awq3KG6vcTN0jZmJEl9lTvk2wAzo/euSWUrAGp/0mG1zTn5WTwyPBS
	 qIy0pOO4VNPy4Mob6sato7lSAcfmKli4OidYuI0tO78gBVvkeamOJ3ZbBElZciUoRm
	 4h5ygxchTqQeBrn59Aw7z/dE6vb9l5sAc68YhkFpfL6Q/5/TULltm4Qo5SXCIoC8+L
	 /cIgawapsiF0AE5tXzGdBfwqhKixaleuz1bq0kUfmOwEVQLzbD/HEIfhRUu0J4ya1y
	 ffzAe3+ukODyjdlYDcoawMqEWuhS5NryHvzXkGgkUeAXsQgvKPzYm5voX5udL+vCSZ
	 8ybyTcxHtD6bQ==
Date: Wed, 11 Mar 2026 17:58:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Grimmauld <grimmauld@grimmauld.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-ID: <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
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

On Wed, Mar 11, 2026 at 12:46:03PM +0100, Danilo Krummrich wrote:
> On Wed Mar 11, 2026 at 6:24 AM CET, Manivannan Sadhasivam wrote:
> > I have a contrary view here. If just a single driver or lib doesn't handle async
> > probe, it cannot just force other drivers to not take the advantage of async
> > probe. As I said above, enabling async probe easily saves a few hunderd ms or
> > even more if there are more than one Root Port or Root Complex in an SoC.
> 
> Then the driver or lib has to be fixed / improved first or the driver core has
> to be enabled to deal with a case where PROBE_FORCE_SYNCHRONOUS is requested
> from an async path, etc.
> 
> In any case, applying the patch and breaking things (knowingly?) doesn't seem
> like the correct approach.
> 
> > I strongly agree with you here that the underlying issue should be fixed. But
> > the real impact to end users is not this splat, but not having the boot time
> > optimization that this patch brings in. As an end user, one would want their
> > systems to boot quickly and they wouldn't bother much about a harmless warning
> > splat appearing in the dmesg log.
> 
> You mean quickly booting into a "harmless" potential deadlock condition the
> warning splat tries to make people aware of? :)
> 

Hmm, I overlooked the built-as-module part where the deadlock could be possible
as indicated by the comment about the WARN_ON_ONCE().

But what is the path forward here? Do you want the phylib to fix the
request_module() call or fix the driver core instead?

I can drop this patch in the meantime. But holding this prolong wouldn't help.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

