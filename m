Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E71CA0FE0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwhbXFqvfTOLpFgnOpIyfl7cPje7A4ufU6fEcZsEouc=; b=3e5dOG9IRTsv4AFpU5wMwqOc5Q
	2PZEXmDoalWwX1+eiuZxjDsOdzhL2xUM9GnnkWiAYwXfQJgf/m10A/rrr7MKlMUq11KTicHEMGUfU
	293KeiimNrNmT3aswJ4hXsVSydM2D77+7PTi75bF9jc2/GUIp5xdiA/Vjp5yfNSVVgLuFLw9a0YNr
	iCAhCKXD1hlgHHsR2SCbvMb1t08hDtZoHoZihPB9Xaz8bSR9bVci9fru4COJjiy4RfFWlcAHgT8me
	vLsp0dsNE9NEm1QY7FOigJ65zEvG/oSyIYQh9bKsdSjmAAU8REH0k5hNJ1WSRg1V58O2ygI1eNHFC
	JnhrrBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7V-0000000FdVL-3KO3;
	Thu, 21 Aug 2025 03:37:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosqR-0000000FGyh-1gGX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:07:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1FF261446;
	Thu, 21 Aug 2025 00:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCFFC4CEE7;
	Thu, 21 Aug 2025 00:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755734874;
	bh=c47+fMWeDw96kRkQrYoUXjIWccy+0mVTu7/4RDUErVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dL6rtiBAFhyMJxcIoWiQkGRYy9OMELDo37o6D+6qYXEkDPigImN/LKO+hNSpPmM7Y
	 Zn+9vyJhWwTRQDIMi2KRVzvbogEMyt1XuDTf4yh29aSvODa59AjjyK9LBXD/PSpNzB
	 qjnTQufuJYw6ByM210NgYFrK4spA3idE9VxaoCT+vLLPz1M3LvnweCzROWxT6VQ+Ng
	 GtoevQnHbPsWpFxpRtcI/ClxAQHgul/d5uh3CN+SdO9AV2LTMa/6RiZGBJYPzxfeWd
	 8cgTbkn45VW+9cK85GkrJFTxmSLYQB6oRFgmjjX7ge0snUhVNyRplNa3mCLLfjCweh
	 gZrSecoSJY+Gg==
Date: Wed, 20 Aug 2025 19:07:48 -0500
From: Rob Herring <robh@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to
 yaml format
Message-ID: <20250821000748.GA1767841-robh@kernel.org>
References: <20250818183814.3603308-1-Frank.Li@nxp.com>
 <ddcd3af2-534d-4708-9f7d-e301a91373ab@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddcd3af2-534d-4708-9f7d-e301a91373ab@mleia.com>
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

On Mon, Aug 18, 2025 at 11:02:58PM +0300, Vladimir Zapolskiy wrote:
> On 8/18/25 21:38, Frank Li wrote:
> > Convert lpc32xx-key.txt to yaml format.
> > 
> > Additional changes:
> > - set maximum of key-row(column) to 4.
> > - add ref to matrix-keymap.yaml.
> > 
> > Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> FWIW I'm fine, if this change enters over linux-input, otherwise I'll send it
> in a PR to linux-arm-kernel/for-next.

The input subsystem is the default.

Rob


