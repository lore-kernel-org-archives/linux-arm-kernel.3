Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ADDC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcY5lCMzzbsfrlx8fIBhERSXargFQ45oBwuw6EHCuyk=; b=mcmhxCXCHjh06cDG8YENA90PZN
	JIYvXFH511wGCteHTtdrMP/yw8LPiXBA3vMvW9kBFC4QPDcAkCOZi9kAkWR2PEVVMizmXJ5yx6JNr
	fxmjgAUtFSf3OT8fSR3MTOWjUPi9zqTtX9J3vcGvvqWOwJOB7leWq9Oi4cPD2dWZqNwjA26zXtTeK
	4qfSBzugmVIUTx1rXPiMY4GDF3LW5GJ58AZ4Fs9eq+0w8lo4OBkp+2a+UXaZZla8y7gHSRZH5o64y
	fAoCLPDW7HKe3QXtLTMGHfG2bl7TNwMlK6B3KaGuxGiN3ccXErAtRUGqX5Emx7+CtsOBx2YznXFA3
	P5BJOk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPfb-00000008bYa-32oV;
	Tue, 18 Aug 2026 19:40:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPfZ-00000008bY8-1Wkq;
	Tue, 18 Aug 2026 19:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qcY5lCMzzbsfrlx8fIBhERSXargFQ45oBwuw6EHCuyk=; b=ahId5uog8Ffs5KIo/LUL03I1vd
	duIMVbKN3UkcDna0YmZEal2W7nQdg8aKn7BOP12XRJH7a5u2sT35vbzcbP6VmqbpEcdn+QddbtRDX
	XMClXaNS9hganQXJt26oXTOOogAJuK61zg1j76utj3RfadhDdF48bTb0OQ+l+DPwQVuc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wwPf8-000WD7-SX; Tue, 18 Aug 2026 21:39:54 +0200
Date: Tue, 18 Aug 2026 21:39:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Cc: netdev@vger.kernel.org, chester.a.unal@arinc9.com,
	daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, yangshiji66@outlook.com
Subject: Re: [PATCH net] net: dsa: mt7530: do not advertise EEE on MT7621
 switch
Message-ID: <4854e2d6-df1e-4ada-bf49-0623bd207e6a@lunn.ch>
References: <20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_124021_440234_79C4AC89 
X-CRM114-Status: GOOD (  11.39  )
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

On Tue, Aug 18, 2026 at 09:28:29PM +0300, Vladislav Karmanov wrote:
> From: Shiji Yang <yangshiji66@outlook.com>
> Date: Sat, 28 Mar 2026 23:29:56 +0800
> 
> There are hardware defects in the MT7621 (MT7530) EEE support: with EEE
> advertised, some link partners cannot establish a stable connection.
> Notably, on a 2-pair (4-wire) cable where both ends advertise gigabit,
> 1000BASE-T training cannot succeed, and instead of falling back to
> 100 Mbps the port flaps in a loop and no link/DHCP lease is obtained.
> This is confined to the WAN / phylib bring-up path; the DSA/LAN side on
> the same device is unaffected.

Do we know what is broken here? MAC or PHY?

If it is the PHY which is broken, it would be better to put the
workaround into the PHY driver.

	Andrew

