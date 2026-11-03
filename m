Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6745A606D802
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iO8sh/ie;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=cbtfboIg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Hc0x0QRxuaqe8TvUFZCR5wxt2TwNiv26WvHElMW/+5g=; b=iO8sh/ieQ2MgC0
	YWBqVZb+uRVyND3D89J4zMOde/Cjwv5/4qgp33zgIaNcOFtbWyWjO/xrsrwISyhKAzUdwV4+6pu10
	IF5BcpVyTjmmRAlCkCMLpmxQF//bZWP2naeYQtS6BCGOVTN2+rkjurx6EarUW4Ij6SiEbRH+XhHWL
	fWitySY2X6iAtn6c3xM09GNFGL4rxeg8dpW5urrVCy8ut+dYRlq5xdrZM6TO4mlDg8crAy/kqlDHM
	kthatW8sS+mbxW1EARJ6MlLyZgc/ocWKNm1zMuDO4pCgTT1GrVQPZcNlk+xS0uq7morbK60tPjFgA
	d21uarkW+QXgJIuO0AYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO15f-00000000bWl-1YBV;
	Mon, 02 Nov 2026 23:05:23 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO15c-00000000bUn-3TTH;
	Mon, 02 Nov 2026 23:05:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793660714; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=izFyDDATMdgrU2HVh7JdT5XX1kw8rOmCSbHgppnh7I47k+hddu6SodTXdvbxzkrOcww7oDBnmnsmufSTEPhaUyPxTG/ulGXMU7Z9JfSo6ogRiVXid15nDwl4gVasmKK7IMW4hno5Y2SlTBWMRTJFxj8IC0vC6U5Q7tk5AUQ55DI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793660714; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hc0x0QRxuaqe8TvUFZCR5wxt2TwNiv26WvHElMW/+5g=; 
	b=c4e8w8jwri0MDoSdsQ4Q51tc5+DxyPrBhtxxgQXV9+mXpO1T/k5+k1JR9De8kKGkeulkDP0L7jdxzfkO89b+Vr2mAmviH7T4jKvBmWFu/k4N/cU53kBwofQh62DZvtCyKCb7CgIC/FQeqxpb/VJirD12WK4neZyaO3XFQzH/WVY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=cbtfboIgWaKtR+K8zOSJqBrhX5Bm8M63HgKGZuulkeSi4LsxoYJcQwEYJqK0CaCDy0L7EykH6rsUUxV5gx0nu3dyuz1r1eePMWm9ud7jUT1bPN11uXxyFZtAWE951EgfyP/vALuKqSOcfEOV6+Ey8jYgoJWU2PyPn7cgyO1t+dw=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Hc0x0QRxuaqe8TvUFZCR5wxt2TwNiv26WvHElMW/+5g=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793660713451663.662783201423;
	Tue, 3 Nov 2026 00:05:13 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] media: rkisp1: Depend on PM
In-Reply-To: <20261102223316.GB3548113@killaraus.ideasonboard.com>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
 <20261102223316.GB3548113@killaraus.ideasonboard.com>
Message-ID: <20261103005500.rkisp1-pm-reply-1@iav.lv>
Date: Tue, 03 Nov 2026 02:55:00 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_150521_136281_B215132A 
X-CRM114-Status: UNSURE (   6.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026, Laurent Pinchart wrote:
> > ARCH_ROCKCHIP and arm64 ARCH_MXC select PM,
>
> Why do we need this patch then ?

Only COMPILE_TEST builds reach PM=n, and there the driver still binds and
probe reads RKISP1_CIF_VI_ID with the clocks off. Nicolas asked to close
the PM=n case per driver [1]; rkcif already depends on PM. If you'd rather
leave COMPILE_TEST-only configs alone, I'll drop it.

[1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com

