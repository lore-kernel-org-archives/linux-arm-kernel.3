Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFD1D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 23:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABW+11sQ1l4nBs8Olbs/aP1MX6sdIare85wg7ZRgab4=; b=XaV0yDmNpBNjNWYOA3NzdNTDFS
	1mDhmNXwwY0H3G+UPupAp/Z4gmGPoyYfgMVnfj35203Wc7bJ1BXe/lSZsY11kQXO2Cn/empqslHTE
	itMpTJLFOcKmn1D/9Mm+bwodx7KVM/8fiO4UF+eYw6gKsO9jSwbyKUcdsz9lsVKcoVEsqWFFJ3+Re
	ZRCwJU1xgQVzm4fTzOd00tD6ZRao4lDOnlyOvVYZvcfeYlWcgaYT+VYfU1fFeCLN94IH6dAb4C4yD
	KAfRV8RHAwwa5dkof+j/Kt51BqAgn0iPdU+uIVbdo0s9tO2N28IWk9P3Bog93p1giJogB67fwpZU5
	adU5WZsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAe6T-00000001ePr-04QI;
	Mon, 11 Nov 2024 23:45:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbt2-00000001Mic-2rUG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 21:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CDE15C5863;
	Mon, 11 Nov 2024 21:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A315C4CECF;
	Mon, 11 Nov 2024 21:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731360231;
	bh=NaCDGDciMwXtP8AUG1ZAj+h2gJO6t1bPaGcNDVapqAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGeajZqhjZasGKQm4q6r+WxsrNe2qCdR8p7pVfXpD/oW1Xy/qHoKXKF2ZVi7IlQEu
	 bQznd75PmHJeMy1KncMfKpBjPnUWuIW6E7HgY45LfIiGB6Kv5JD76iOhJyovUAejMq
	 NkgaEhkc6Y30Ax1HTcS1Zt5p1ubGbiory1TIjkjuqg8fW3AQ0HAlAEENZGfxpL9++c
	 qilmeCsNN/1EveDny5370zOPFT0Ke5NnLmoAA4XLloX4IaWqbkpJ61W7Kn3qUmE/q3
	 GNHKQV2ePkM5uhHrXDa4sgdWjj4Ifd3bWb1Bboe1IrcIBHPhIFKu+a0JGWnFNtNIZc
	 RV4xF8d6+swXQ==
Date: Mon, 11 Nov 2024 15:23:49 -0600
From: Rob Herring <robh@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Conor Dooley <conor@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Subject: Re: [PATCH 2/5] dt-bindings: arm: ti: Add compatible for AM625-based
 TQMa62xx SOM family and carrier board
Message-ID: <20241111212349.GA1955710-robh@kernel.org>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
 <4f5ad877f44df35a3b2c7f336647f057c4e6377d.1730299760.git.matthias.schiffer@ew.tq-group.com>
 <20241104-floral-dexterous-7d3fee2ff616@spud>
 <c73cac598788ccabd1791b1232e8fd9d7ce23ac6.camel@ew.tq-group.com>
 <20241105-tinsmith-countable-fbb51045bc98@spud>
 <7286141141fe4930cd2581dac7a1fb36a98e62c4.camel@ew.tq-group.com>
 <20241106-happy-anything-46f7293f6aca@spud>
 <068c22af19c07a7c79bb4abb0366a2505b4b1aae.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <068c22af19c07a7c79bb4abb0366a2505b4b1aae.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_132352_830226_0EF6B9B7 
X-CRM114-Status: GOOD (  19.71  )
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

On Mon, Nov 11, 2024 at 10:58:57AM +0100, Matthias Schiffer wrote:
> On Wed, 2024-11-06 at 16:40 +0000, Conor Dooley wrote:
> > On Wed, Nov 06, 2024 at 01:03:08PM +0100, Matthias Schiffer wrote:
> > > On Tue, 2024-11-05 at 18:55 +0000, Conor Dooley wrote:
> > > > On Tue, Nov 05, 2024 at 11:40:20AM +0100, Matthias Schiffer wrote:
> > > > > On Mon, 2024-11-04 at 18:47 +0000, Conor Dooley wrote:
> > > > > > On Mon, Nov 04, 2024 at 10:47:25AM +0100, Matthias Schiffer wrote:
> > > > > > > The TQMa62xx is a SoM family with a pluggable connector. The MBa62xx is
> > > > > > > the matching reference/starterkit carrier board.
> > > > > > 
> > > > > > Why all the wildcards? Why isn't there a compatible per device in the
> > > > > > family?
> > > 
> > > Because all variants use the same Device Tree. There is also only one compatible and one (main) DTSI
> > > for the AM62 SoC family, which our Device Trees are based on.
> > 
> > So what varies between the members of the family?
> 
> There are currently 6 SoCs in the family:
> - AM6254
> - AM6252
> - AM6251
> - AM6234
> - AM6232
> - AM6231
> 
> They differ in:
> - Existence of GPU (AM625 vs AM623)
> - Number of Cortex-A53 cores (last digit)
>  
> All of these use ti,am625 as their SoC-level compatible. The differences are currently handled by U-
> Boot, which checks various feature flags in the SoC registers and patches the OS DTB accordingly by
> removing CPU nodes and disabling the GPU node if necessary.

That's how it should be. Most likely, those are all the same die. 
Different die are expensive and it takes a high volume to justify the 
cost.

Rob

