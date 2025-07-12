Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F485C83F20
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 10:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTgJpmSd6LhUXQuIB22IcfoJEWSMVfDYaSNR4+UA678=; b=Vk2PJc7P1MjNfUHyyW87x5EKd1
	NK+V8VWJ7EIq9JaV1cxEM/OGzhtwhaAZOXBdGKlvi3eaGdNNZbhcE10zXPdjqGxi6HZBd53lVSOiS
	7JDgqsa4PqxG9kAcqSvIx7L5QOZhjI3CVt/KhZYzR32dMQxuNhXPMtxQa5EYtXhbEkn2F2FNHtdaL
	VJYWZy4M2R7/ML+Axd+CRMMczL+K698HyAFpecOXNPTD6m2KgGyY/ox5KpZwwAOLHL5VtX299k1n5
	747MF3a5ZfLztrjFZf/UBvGVI6rp8/4bCuvlP+hpsTEEU9wYprTZKqMSae1+NFowQ0ez2P9wD8a0r
	3DuuPJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaXgk-0000000GY8X-22br;
	Sat, 12 Jul 2025 10:42:38 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaXeM-0000000GXsf-1u0q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 10:40:11 +0000
Received: (wp-smtpd smtp.wp.pl 42019 invoked from network); 12 Jul 2025 12:40:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752316807; bh=qTgJpmSd6LhUXQuIB22IcfoJEWSMVfDYaSNR4+UA678=;
          h=From:To:Cc:Subject;
          b=yv0ZYtfYVIyUtWCPL0JQMBhSr+6rYxg/gu36uJsHkR9DG+bwk4cRSrZ+HM4sRq85R
           oCgJNh/5S5u+D3P2NjBIRNurak3N3BAk6Jfa8zrsVFv+abBriFKs1giWDJHePdnTn8
           awhIFsMi/PKXJqSUusvyXjpptxLNdVQvqlLmdv0dmWScKu80wFw6BwsyzYhid3V9zI
           pxKcDiiBlJHQGVc5Z10eaAuuMAlbd3Z4fzLBHSaSKiDTdeH6+Zk+ngsuyku6PkmItS
           Om36QpxAKISBedjxPiyfqVH+FU0ySxOhUu85Bjeuw4Zllr5EEPt9bG3yNSHvRU6xnN
           tNRKX1G04TYFg==
Received: from 89-64-3-180.dynamic.play.pl (HELO localhost) (stf_xl@wp.pl@[89.64.3.180])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <krzk@kernel.org>; 12 Jul 2025 12:40:07 +0200
Date: Sat, 12 Jul 2025 12:40:06 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv3 wireless-next 7/7] dt-bindings: net: wireless: rt2800:
 add
Message-ID: <20250712104006.GA13512@wp.pl>
References: <20250710200820.262295-1-rosenp@gmail.com>
 <20250710200820.262295-8-rosenp@gmail.com>
 <d8b0abb2-1a12-42bf-aafd-4cd1e21babd6@kernel.org>
 <CAKxU2N-c2tHBYWBM+FJGqdSaqzw9u0O8e0G7AVqk6b0QdRnPTw@mail.gmail.com>
 <20250711-invisible-dainty-jackrabbit-acbf8f@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711-invisible-dainty-jackrabbit-acbf8f@krzk-bin>
X-WP-MailID: c2d83bddf527eb597eb6cc17933b5770
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [EbNB]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_034010_653658_4B3837A6 
X-CRM114-Status: GOOD (  16.00  )
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

Hi Krzysztof,

On Fri, Jul 11, 2025 at 09:48:49AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 10, 2025 at 03:40:30PM -0700, Rosen Penev wrote:
> > On Thu, Jul 10, 2025 at 2:40 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On 10/07/2025 22:08, Rosen Penev wrote:
> > > > Add device-tree bindings for the RT2800 SOC wifi device found in older
> > > > Ralink/Mediatek devices.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  .../bindings/net/wireless/ralink,rt2800.yaml  | 47 +++++++++++++++++++
> > > >  1 file changed, 47 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
> > > > new file mode 100644
> > > > index 000000000000..8c13b25bd8b4
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
> > >
> > > Filename should match compatible. You were already changing something
> > > here...
> > hrm? that makes no sense. Various drivers have multiple compatible lines.
> 
> Luckily we do not speak about drivers here. Anyway, follow standard
> review practices, you don't get special rules.

Could you please elaborate what you mean ?

I greped through Documentation/devicetree/bindings/*/*.yaml and plenty
of "compatible:" items do not match the filename. So hard to tell
what rule you are referencing, as it seems it's not really applied.

Regards
Stanislaw

