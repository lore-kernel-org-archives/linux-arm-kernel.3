Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEA7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 11:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+xummqgYb2Lq6yLMj4NF5pLE9s1eEAYV29V7m0JwKI=; b=jXdptVKjgRzFBWmwlzMixcKt+l
	2RWONqSszYlvt7rFOORIb36ZawN8ZISuZ4tDSntkYZBxj8VHshfrqGKe7oHXiRfudPhNfQTxvUw3k
	aGvz7J8yaSf2GynsK4nRyOL0Ng96DxNTqanx8sdYfdEn6aT0g8ve96miq81pIVHUrJdFScYvAwcCu
	X82vijG1HskfX0MqsC09i6IDMEF3oIYETxWzqPdVL6Wyipx+VVT4f2O/x/ex+C9c5+yHWHTdo3zJe
	9iGO80jJp4WJI0enwFIWlqK3Du+AfE3LAc2WBrEgg675hg7qN3quXDD34tkf6/Mc93FqqnCf9jbk+
	hjfg26+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uauaB-000000005Mh-07I2;
	Sun, 13 Jul 2025 11:09:23 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uauXm-000000005CU-2V7s;
	Sun, 13 Jul 2025 11:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=e+xummqgYb2Lq6yLMj4NF5pLE9s1eEAYV29V7m0JwKI=;
	t=1752404814; x=1753614414; b=HHrHImdWu32DT26N0aVLX8zUe+/iLueegivuYn4+ImtMpEz
	WXJbrmqXnW/kqkPIpboq3NRtN+7GuYyAb3kVoeXRVLSvYEbpw4WaQ22xa8KV/uRFVbg2XtTPuVMUH
	d9cZrgSq8cUelgSjECc/vub3mxX3ub6qvUedVXrbn4TmFslYmTno5HjPZmfrpSWBRxZIYJOSzf9gx
	S2OfraYWOA4xhL69/uLBJ8qFfd/ISGVIaeX3WQ9Qf/xVJ9Fem/YHVSlz0ANIeA1G/zgC11dYRNNMl
	IoAT9ZmkCidmjNFVizgvWKs/9+/muAvIw29T7NsS6HTvnGlavduxOWGyK5hfRQ/Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uauXh-000000020HW-1ovy;
	Sun, 13 Jul 2025 13:06:49 +0200
Message-ID: <1f78de8ee5fde6e3e652148c4f75878573957e50.camel@sipsolutions.net>
Subject: Re: [PATCHv3 wireless-next 3/7] wifi: rt2800soc: allow loading from
 OF
From: Johannes Berg <johannes@sipsolutions.net>
To: Stanislaw Gruszka <stf_xl@wp.pl>, Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thomas
 Bogendoerfer	 <tsbogend@alpha.franken.de>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS"	 <devicetree@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>,  "open list:MIPS"
 <linux-mips@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"	
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Sun, 13 Jul 2025 13:06:48 +0200
In-Reply-To: <36c4cd5f263e4bae22a1779a9befd24dacd5d3bf.camel@sipsolutions.net> (sfid-20250713_105038_510459_ADA2EA39)
References: <20250710200820.262295-1-rosenp@gmail.com>
		 <20250710200820.262295-4-rosenp@gmail.com> <20250712101418.GD9845@wp.pl>
		 <CAKxU2N-RXgFKYPAqEu3iZDMAisj_K-b+ZZTGFsabWz7pMK+02A@mail.gmail.com>
		 <20250713071532.GA18469@wp.pl>
	 <36c4cd5f263e4bae22a1779a9befd24dacd5d3bf.camel@sipsolutions.net>
	 (sfid-20250713_105038_510459_ADA2EA39)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_040654_629322_65E07559 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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

On Sun, 2025-07-13 at 10:49 +0200, Johannes Berg wrote:
> On Sun, 2025-07-13 at 09:15 +0200, Stanislaw Gruszka wrote:
> >=20
> > Can be done as separate patch since you already
> > posed v4.
>=20
> Maybe I should point out that I've simply been dropping the patches
> unseen because they don't even apply.

Ah, that's because of Felix's fix, so looks it will apply now that I've
fast-forwarded wireless and wireless-next.

I'd prefer a resend though (perhaps with the small thing Stanislaw
thought might be fixed, your call) so the bot can pick it up.

johannes

