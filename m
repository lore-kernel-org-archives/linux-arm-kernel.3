Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFC3C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/LZx7VJDYrAKfjv7We/Br9wOsZ187pHYwbwOBQRr+E=; b=afqBbzt66y5tYSk6Y5IXHqZisp
	Az2cljTmYWI2Mz1w2fr3ttDzhy5QRFURQXIML0IWsSPh+rVJhxzN05J8DN+HbONUnMPsORbc31lvV
	KrQwnt16FOXrbKRo8zwxL0bxAWDb9ZK54sS9XdI+uKzx3yvqA1wwxi2ALVHzitcrkffnF+HI7hCwH
	Hm4LD34jg4407vRDfScvAV03r2SxCCXS6It9xf6z7nmfLmeabGQBQv3jbxfxoA1obxqsO633mIYoI
	9j5+avCPuuTy5Hx0SQuZNEqLza4LzBU4aTdrrpJr+My3/0GKPIseUuuHtP3cCGU9rG7gYX71h0H3W
	yqwAc+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRde-00000004SFV-2iam;
	Fri, 09 May 2025 17:35:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPhq-000000045n4-44sp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:32:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1110F44C19;
	Fri,  9 May 2025 15:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD6FC4CEE4;
	Fri,  9 May 2025 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746804729;
	bh=qcrU3PLuyJ39f7Grm0C17ELUE5ZOgr1KxGpTaj1TKpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISAhfEKpgjA+Gl/PiXUPhkGgj8Oxjru+p7WwtbAHP5Xrd/7kGAl4Ai7/Ri3hbvTCK
	 evaainhsJHxSGH8KRrUcHMowIQRZZASKx19Nv3RZ49rf8GY+OaARY83wJ+4KUndiRC
	 1iIIBBm83Nn3EeLGG8CBImaZ/A9orzgOJjebgPLo=
Date: Fri, 9 May 2025 17:30:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: serial: Convert
 socionext,milbeaut-usio-uart to DT schema
Message-ID: <2025050912-snide-spoiling-0f7c@gregkh>
References: <20250507154924.1602842-1-robh@kernel.org>
 <2025050935-suffocate-snazzy-c5f3@gregkh>
 <CAL_JsqKjssqGOO6H9RCneo86fKop4bQtiKNcCq_95fOk2CP+eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKjssqGOO6H9RCneo86fKop4bQtiKNcCq_95fOk2CP+eA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083211_029736_0FAD8FC2 
X-CRM114-Status: GOOD (  16.16  )
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

On Fri, May 09, 2025 at 10:29:07AM -0500, Rob Herring wrote:
> On Fri, May 9, 2025 at 9:51 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, May 07, 2025 at 10:49:22AM -0500, Rob Herring (Arm) wrote:
> > > Convert the Socionext Milbeaut UART binding to DT schema. It is a
> > > straight-forward conversion.
> > >
> > > Reviewed-by: Thierry Reding <treding@nvidia.com>
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > > v2:
> > >  - Fix $id path
> > > ---
> > >  .../bindings/serial/milbeaut-uart.txt         | 21 -------
> > >  .../serial/socionext,milbeaut-usio-uart.yaml  | 56 +++++++++++++++++++
> > >  2 files changed, 56 insertions(+), 21 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/serial/milbeaut-uart.txt
> > >  create mode 100644 Documentation/devicetree/bindings/serial/socionext,milbeaut-usio-uart.yaml
> >
> > Are you wanting all of these serial "convert to dt schema" patches to go
> > through the tty/serial tree, or will you be taking them?  Either is fine
> > with me, your choice.
> 
> You can take them. With all of them, we're done converting serial drivers!

Ok, I'll queue them up in a day or so, thanks!

greg k-h

