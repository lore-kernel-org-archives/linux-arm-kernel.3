Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3279D5D699
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 23:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sB9WbFBpbPjCLPWf25Q6cNTRTz1ZxYwqcOTV66sDiIk=; b=3bxVXFKUG7/HndVciXXaGQ/GRP
	vcLXOnPDuZ9CaoSrh/WGkdazb7VH0YAO5twQ0pfXQ9C76MVPwaP3ZJWRqtwwh4ltb0pc1X/0ue4At
	iOCk7dZlLR0d0yyGVWVH5uqFCG7XMZ5tSn2yOwasy65d8GZEdyzMdFEIhs6Tggx0s3o3aEE8WUu7h
	ctm0ucltKGWEscbeERWK35hSuk0cHlN5ubz4QtIYBDkLQvp8f6KwLHfG7y862bIlUA/87Wy1qI4eo
	U5mgTMzXwpwpbCHyDYAp5BJHKw/h58+4Lrg/gHxhNiy5tSIMH86rkNPpKu9ZxoA2Jim/LEJQjfzqq
	7h/qDoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9C67-00000008jxi-0j1H;
	Thu, 07 Nov 2024 23:39:31 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9C4L-00000008jhN-0Wko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 23:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731022653;
	bh=sB9WbFBpbPjCLPWf25Q6cNTRTz1ZxYwqcOTV66sDiIk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=c8md9D9T5JUduyHph29pPdPnY7w/3iZEYl8eeCd5EOJSX66dP9k9iydIqE0HXCPyi
	 DjiCfNC4o2EFaCMetlEvYuPLeFCV++2G7k45SA7oA7t9Ziy2ihmAMjySdj5aIrCq8O
	 m4UjPv7OEbc3uBm0jZJBzHyVwA5i0oqDcc7JxyK/lzoXZ4lxLn/BPqBP5QXMV56vOD
	 7VWPQKvP0QnqVCenDj6iZDILl4LN5Aza1KJz5Kw8K1/azoqvLt5GT+z5iu9sR8Jksv
	 slHkyrZedpDOAqfsH9kjnMjTedB/oAb0AsGNjTW98Q2/os6kSm5kOqZksbBGNoofEB
	 ccB2MndkxgVzA==
Received: from [192.168.68.112] (ppp118-210-167-185.adl-adc-lon-bras34.tpg.internode.on.net [118.210.167.185])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C37FB6B922;
	Fri,  8 Nov 2024 07:37:31 +0800 (AWST)
Message-ID: <1c8f39015eae7cc71fbfb9136af8a728d743a991.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: catalina: update pdb board cpld
 ioexp linename
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Patrick
 Williams <patrick@stwcx.xyz>,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Potin Lai <potin.lai@quantatw.com>, Cosmo
 Chou <cosmo.chou@quantatw.com>
Date: Fri, 08 Nov 2024 10:07:31 +1030
In-Reply-To: <CAGfYmwVxwaZk-si1OkP4xeaODhAO74Hv43U=SpzOsGOBkTH8Bw@mail.gmail.com>
References: <20241106-catalina-cpld-ioexp-update-v1-0-3437bcfcb608@gmail.com>
	 <20241106-catalina-cpld-ioexp-update-v1-1-3437bcfcb608@gmail.com>
	 <8e858e760c78ddf533e9e03c20b34fce29862c2e.camel@codeconstruct.com.au>
	 <CAGfYmwVxwaZk-si1OkP4xeaODhAO74Hv43U=SpzOsGOBkTH8Bw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_153741_379201_E238994D 
X-CRM114-Status: GOOD (  21.90  )
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

On Thu, 2024-11-07 at 19:22 +0800, Potin Lai wrote:
> On Thu, Nov 7, 2024 at 7:41=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Wed, 2024-11-06 at 16:58 +0800, Potin Lai wrote:
> > > Update the GPIO linename of each PDB CPLD IO expander based on
> > > latest
> > > CPLD firmware.
> >=20
> > What version is the latest CPLD firmware? What was the previous
> > version
> > with the old pin assignments?
>=20
> Because the hardware changes from EVT to DVT, the CPLD firmware
> reallocated the IOEXP pin mapping in DVT version.
> I will add more description into the commit message in the next
> version.

If you have different revisions of the board, it would seem sensible to
have separate devicetrees, one for each, rather than constantly
evolving one devicetree? Tack on an `-evt`/`-dvt` suffix as required?
From there you can always have a suffix-less dts file that #includes
the most recent board revision. See some of the Aspeed EVB devicetrees
for an example.

>=20
> >=20
> > I'm also interested in some discussion of the coordination between
> > CPLD
> > firmware, the devicetree and the BMC userspace configuration. This
> > change feels pretty painful.
>=20
> I am not from the CPLD firmware team,

I don't see why you need to be? This is a cross-component concern, and
you need to make all the pieces of the puzzle line up.

>  I only know our CPLD team was
> redesigning the entire struct which causes the huge changes of IOEXP
> pins.
>=20
> This is probably a different topic, I am curious about is it possible
> to assign the linename in userspace?
> In OpenBMC, there are many services that depend on GPIO linename, it
> will be more flexible if I can assign the linename before service
> starts.

Not that I'm aware, and to determine otherwise I'd probably need to
read the implementation as much as you :)

However, separating the devicetrees would go a long way here if the
CPLD firmware is tied to the board revision...

Andrew

