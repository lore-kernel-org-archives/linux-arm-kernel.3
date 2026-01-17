Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342C6C98313
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 07:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdlOn1I41Zqd44BG7MCUu5UClg6gpX5+yMhdknwzGfY=; b=oQSQUXue2WYND2pIJGiiOO8T0i
	hg2y9zKP0mQSopvS5w/ZtNmApVc2rkZq+C092qekk8y4h/CVUGb3j9JDh+4DjAfAtaEGG/DIjUbe3
	kzh/L58CHuzCbgDraO/em1iOMOcHHWxuRd9U0XtTloj1zY6jJ3PQXJYlQ6NXKJZZOT3bI9H8H2hjX
	TjMZAb1RBViTe6Su49ed4efkSUptyzCYCLP86bbt9p7zPyJ4k0G+UMtn/eUBKbJMGvAvZJKbrSO4f
	W6LU5RbHDkve9E7GxvknMH+95YFcEt2AYzjaUUMFzbpyaf83agZ+gR1XHbV1eKEWXA78smwHZRuuW
	X1Phh2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh0fi-0000000FMkU-01rq;
	Sat, 17 Jan 2026 07:24:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh0fg-0000000FMkN-25wb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 07:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 860A660127;
	Sat, 17 Jan 2026 07:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7ADC4CEF7;
	Sat, 17 Jan 2026 07:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768634670;
	bh=kQ+PwSYBZgJw8xmRPS4CRiAMmUyORi+7+mylOQXpKBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KofW8/93lpPLKInknOsh8BnRBv3xSZN4KpOq3+PFg8hh0ksqLYWbfo9LRqA9ABT4e
	 61I0Ydnix2kTOq5UG4RxwE502SeRO0Y52W0xj6foZgqcmARtm/iCcmCs/kGEoDLQVE
	 nWpXltdhl6rFbfHnKjxlP629ax4Pu4Rd4frogJg1B+sS9ZD8/6/DgYPDdUcPNYLfES
	 ZQgXb5LAtOpNO+5bCNqzEZ+CuuXRxcZ9ugHx588xUXViaxSY/iTo6E31XURt6hM+Ul
	 1C364PGUlwLYLsBuxu9zGqHrVMOXDhCUvd8rlWYSQOe1UFKgu1tc8O3WD1+Afy0LXp
	 rANCdYzWXRNxQ==
Date: Sat, 17 Jan 2026 15:24:24 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Document ifm
 electronic gmbh
Message-ID: <aWs5KBf-ur3fOBVH@dragon>
References: <20260106190147.31924-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106190147.31924-1-marex@nabladev.com>
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

On Tue, Jan 06, 2026 at 08:00:37PM +0100, Marek Vasut wrote:
> ifm is a manufacturer of industrial sensors, control technology and
> automation solutions. Document their vendor prefix, which is already
> used for ifm,ac14xx and other powerpc devices.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Applied all, thanks!

