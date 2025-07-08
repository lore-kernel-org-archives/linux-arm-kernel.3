Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C48C71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 06:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgkicBTpwhIu4KhwMQ9MKtUqejjyYnHk87N/snpkRoM=; b=AI0mxrBu6eQj4HsjnoE6VRF71n
	Ucssk7mLZc28HRMjlg8T+02eRAEjqosUBMjPqGAvquH/OSQ/RVL3A0ONJqNWSHPMaLVAblLQ+WvVs
	zZltiDK99S2WZl317DTAn1diCmTkbH5wWdND/5fHSh1Lpz0ccF7EYM19MDbDAGguADVKl49ktNIsF
	PemHMD7wf3SYudFfBVg76doMHIY1BNusiQ0aHufbXOhkWZrDf5LNyxY1N5iiucMJyoODQq+mgk6zQ
	oEcQYvOgUQsS1T9Y3nZQlL5tGnlm9DwoBq3+M1BpMtjLQI+b79MPSWvRAcOAtAkJo02aPwO9EbzZG
	5QF38ImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2Ec-00000004Vfv-20Ts;
	Tue, 08 Jul 2025 06:55:23 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2Bh-00000004V5Y-2kOf;
	Tue, 08 Jul 2025 06:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=QgkicBTpwhIu4KhwMQ9MKtUqejjyYnHk87N/snpkRoM=;
	t=1751957541; x=1753167141; b=Dfdsw+Bj2iBCJHeB8JN/EUh8VbbV/3x+0Y2buBSwHvp9+JO
	+uHK8yHA902jM5dK2S96MzUFXimK9NYme/g0gJUU5Q9K3vluuiMDXnQoE1+DXxSuZfQfOB7Wwl2Mc
	xudu2t/YQVLW1xM+kQqUV/MV74eVAhb7ev9dO2SztfnCpT5fQ81WBaB52WWzr6c8EZc96JT9my0TU
	aGEhl+oEzTSgMcRKgvd1M8zSEUTva1h0HRowWqSEw5dFZq4KnQWi6pIOdRUhA+gO9Zwx9BPij0QKQ
	5ZXQN5jWsTtzNIv4UcTYtILCs7suFRUuDT3Grt8YuiidlbdpRUjCtqX00TBVmlyA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uZ2BD-0000000BePp-1ddS;
	Tue, 08 Jul 2025 08:51:54 +0200
Message-ID: <304f48242d99fec81990d492777cb45a58aa038c.camel@sipsolutions.net>
Subject: Re: [PATCH 0/6] wifi: rt2x00: add OF bindings + cleanup
From: Johannes Berg <johannes@sipsolutions.net>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, yangshiji66@qq.com,
 ansuelsmth@gmail.com,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka
 <stf_xl@wp.pl>,  "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS"	 <devicetree@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>,  "open list:MIPS"
 <linux-mips@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"	
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Tue, 08 Jul 2025 08:51:44 +0200
In-Reply-To: <CAKxU2N-XviPav1Bh0yidyMUr=QbMr=0jyYyHKc+h0oaM9vak=Q@mail.gmail.com> (sfid-20250708_005520_408645_C4B0336E)
References: <20250706214111.45687-1-rosenp@gmail.com>
	 <8c6f18ca47bf0dd78b6675d8b94000679b6c75cd.camel@sipsolutions.net>
	 <CAKxU2N9vs5o4tj-9KxCHKevWU+J9wv+ZCOeD8o602y1GY8FzNw@mail.gmail.com>
	 <b3a63d616c1ca337f6b9d14a9afaafe73bfbe8cc.camel@sipsolutions.net>
	 <CAKxU2N-XviPav1Bh0yidyMUr=QbMr=0jyYyHKc+h0oaM9vak=Q@mail.gmail.com>
	 (sfid-20250708_005520_408645_C4B0336E)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_235221_715107_A7015F7C 
X-CRM114-Status: GOOD (  12.16  )
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

On Mon, 2025-07-07 at 15:55 -0700, Rosen Penev wrote:
> >=20
> > Yeah well. That doesn't really mean it should be merged together though=
,
> > and we can pretty easily make that work by just putting the further wor=
k
> > in after net/wireless is merged back.
> Looking at it again, I'm effectively removing rt2x00soc.c . Meaning
> Felix' patch is mostly useless here.

But we're not going to put your changes into 6.16. They're not even
entirely ready yet, from what I see in the thread.

> It might make more sense to submit this series at a later time.
>=20

By end of the week Felix's patch should be in wireless-next too, if I
get all the things done right...

johannes

