Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BCEC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1az4yu7iqOsk7/laCMEVbA5WLFs2TsRctSfdyzrGEf0=; b=bzA1md9cfHKrGevZKi35uQepRr
	BTIrb9q3Pfl5NJQicdguD2O1eRFLJHxgJiQ/mwMv+RhxfYM5apxAWOIlg5G/ksm+cN9m4sU/3SMa0
	RdLvMGg5fFVI7ViWka2Xdhl8CyEAAnSxSCMc+Ehtdk/Lso13TogZZsot89bHOGvMNXio7Tkz/T+TH
	UeqNYH35YAhMhk7SFhpYfA5gDYdgAKqF6VyQ7PsmrBcGALlR9gK7yQoXV6VstUH6sDedZ128WE6EE
	DeonxdUph+RDoccwdPWvdpFN21jvmePF0wufk+rw2geEKReaWAmmbEJ2U4cO/4dzvNB8/084e9cwl
	einG7txw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiJx-000000020lX-0jd4;
	Mon, 07 Jul 2025 09:39:33 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhjL-00000001uyi-1Kga;
	Mon, 07 Jul 2025 09:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=1az4yu7iqOsk7/laCMEVbA5WLFs2TsRctSfdyzrGEf0=;
	t=1751878896; x=1753088496; b=AbefW8JIkx+Wu6k1bN0BZGEz+CLKCnESDIpeLyrdHN4H/zG
	w2dLCEw4hdiOCBRePvvMgxi4NMhPsYyBseFiWJWoJlzahql97B7+WPWd0YNM3PCBgfnsJxORxLKYU
	TCaxEgzD7uy616rgoFjDhKdukFCC9dQcc8BDCU/DmNpf2MUgS8NzfKRXqKdlKB6r7q7+P/O3rHH3M
	t1Q+O5BroNTKCVXS3e04nWEH+6oKk0gLApvIhkzQHrIkswsUBG4ccJxF9emISLGtotai3MAMzdu+A
	p9mc0eMpgS5PMxzk/x98yM+wIuj0wJ63wcdZLHtiYqIvMiuWO6Fz3BmhUadlkHMA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uYhiy-0000000AUYl-2sdF;
	Mon, 07 Jul 2025 11:01:20 +0200
Message-ID: <8c6f18ca47bf0dd78b6675d8b94000679b6c75cd.camel@sipsolutions.net>
Subject: Re: [PATCH 0/6] wifi: rt2x00: add OF bindings + cleanup
From: Johannes Berg <johannes@sipsolutions.net>
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: yangshiji66@qq.com, ansuelsmth@gmail.com, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer	 <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka
 <stf_xl@wp.pl>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS"	 <devicetree@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>,  "open list:MIPS"
 <linux-mips@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"	
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Mon, 07 Jul 2025 11:01:18 +0200
In-Reply-To: <20250706214111.45687-1-rosenp@gmail.com> (sfid-20250706_234116_623750_4C5D292D)
References: <20250706214111.45687-1-rosenp@gmail.com>
	 (sfid-20250706_234116_623750_4C5D292D)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_020143_380254_FF94EC10 
X-CRM114-Status: UNSURE (   8.13  )
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

On Sun, 2025-07-06 at 14:41 -0700, Rosen Penev wrote:
> It doesn't even compile. Added OF bindings, documentation, and other
> stuff to hopefully this doesn't happen again.
>=20
> Rosen Penev (6):
>   wifi: rt2x00: fix compilation
>=20

That was half covered by Felix already, and really shouldn't do two
things at the same time anyway.

Also please add [PATCH wireless] or [PATCH wireless-next] prefix when
you submit patches, to make it clear where the series is targeted. In
this case, you probably should've split it up, but Felix already covered
the immediate bug.

johannes

