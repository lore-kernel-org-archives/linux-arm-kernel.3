Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A98D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 02:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1MNe0hGDJKTb1VF5QgCyUy1hqeTflXZVWtlHjCUpe3Q=; b=dQNxr2MHPMVACymw1axr7yQ929
	biAgMODcnZoa2pjG5nZuxVrweXEKwe4RQ7HzpSD9PdYQPSq/xYVeBYD8/Q0R3VUOjhYFg1YBfUGU6
	ZfedAcQ2DfzOPV0904+UiHeAXiPt8btoOdeCr5tJk5Nz3R3lu1Z+6H+u1hyVA//GbdX4JljLZcFKl
	dSX25mYDPrlJoM3W/ClgaphmJ55dAcEchAp8Fbu1WSt/yGNfgnGH8Dt0g5vFB5JgPW6csvJJTi7Jb
	kpZWI1Bln3gDnt7QE/bvM4f9gWOBFAMizvMXhCcfQviUco6RaL6qfRSgNF9Jit7NdsI7tPeb4Oel+
	h8YDbpYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTt2v-0000000HYwR-2vCE;
	Fri, 12 Dec 2025 02:38:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTt2t-0000000HYvP-0cVA;
	Fri, 12 Dec 2025 02:38:16 +0000
Received: from pendragon.ideasonboard.com (p99249-ipoefx.ipoe.ocn.ne.jp [153.246.134.248])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8DD0713BA;
	Fri, 12 Dec 2025 03:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765507086;
	bh=T5ZdSh49BDJDiP4MenDdFaFjtjBDzQhBDclBlvx5ahA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/l3PVm7iJ6QTUcRxiMZcb3ecV8ocLKO9p1AgMesmB29uhJiZ7vcENd/w2SejKjdy
	 bqjHr5yL6PqeLjKQts8d4lfrG9TWj9+ub7tkSWvT06k3b4MzWj08lDZEJp+94nsjXR
	 amQ/JxtEyNKKQw/Y4VfpY/eB3wFxKP9acKcuKPOU=
Date: Fri, 12 Dec 2025 11:37:49 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0
 alias
Message-ID: <20251212023749.GF28411@pendragon.ideasonboard.com>
References: <20251102111443.18206-1-laurent.pinchart@ideasonboard.com>
 <CAL_JsqJg4aYGyd49UAAPBw+FGpmGxV5JkdkXp2FK_7Gt+7DLZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJg4aYGyd49UAAPBw+FGpmGxV5JkdkXp2FK_7Gt+7DLZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_183815_323381_0A4A8F2B 
X-CRM114-Status: GOOD (  16.99  )
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

Hi Rob,

On Thu, Dec 11, 2025 at 12:42:40PM -0600, Rob Herring wrote:
> On Sun, Nov 2, 2025 at 5:15 AM Laurent Pinchart wrote:
> >
> > The RP1 ethernet controller DT node contains a local-mac-address
> > property to pass the MAC address from the boot loader to the kernel. The
> > boot loader does not fill the MAC address as the ethernet0 alias is
> > missing. Add it.
> 
> My change here[1] is going to effectively revert this.

:-(

> The RP1 stuff
> needs to either be an overlay or not. We don't need both ways.
> /aliases don't work for overlays. I suppose that could be added as a
> fixup when applying. The kernel also assumes aliases are not dynamic
> and uses indexes which aren't present, so even if it did work there
> would still be problems. OTOH, if the bootloader might use the
> ethernet controller, then why would this ever be an overlay in the
> first place?
> 
> Turns out digging into RP1 stuff, it is a mess and needs reworking[2].

I don't have a strong opinion personally. As far as I understand from
https://lore.kernel.org/all/cover.1748526284.git.andrea.porta@suse.com/,
non-overlay support was added for compatibility with downstream. I don't
know why the overlay option was considered better for upstream. Andrea,
could you comment on this ?

> Right now, I just want the warning gone so I don't get further complaints[3].
> 
> Rob
> 
> [1] https://lore.kernel.org/all/20251117211503.728354-2-robh@kernel.org/
> [2] https://lore.kernel.org/all/CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=syo8xLKQw@mail.gmail.com/
> [3] https://lore.kernel.org/all/CAHk-=wi+ge-gtCg+iLd6dgjisGchjtsKY8AXG9tXGOxqVv8Fkw@mail.gmail.com/

-- 
Regards,

Laurent Pinchart

