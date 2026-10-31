Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E69606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZpwA1BWZ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=jzAu9FRJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IA2zfU+elFDnFUhawKqcn+g6PD/rFJZaMV/qgUC1Ch4=; b=ZpwA1BWZ2c7EDT
	hliiMaGLQbE/hx5B3m0ApkjFJy9Fv3qGn2XiVyn2s87W1I9TY5RpDZdX09cYOn9O2y3Uzbu0CSt3U
	8/fYCAtB3wKidqcDbtMEpsL9Q1AsfdZMwqKmIg+CK0071EZp3o5JNvfSFTTXlCF43U+9TZnyYVhA0
	rhkYYTNMt8d5WRQQNEozR5r9umd1/NWlO8t7ailxrgL27kNh50szjhSMOmqhHw783OkjjEJS2I7Ew
	vJ094nmntUZNnr2u6MoVYjjsbSyQckXKJzQYNssxidWajpK2mPRjlODxbl0IzViEtChdWmPQYej9E
	sdxg9AX8k/uvPHJ4HTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN9Oc-0000000DNLp-07s1;
	Sat, 31 Oct 2026 13:45:22 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN9OX-0000000DNKH-06sv;
	Sat, 31 Oct 2026 13:45:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793454313; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h/xD/GnjIT4Rf3g3eJLjZfk3+Qsa80d2N2y7utHj6RLU3orDPYbpqk0pR7Ywl8RAqUXhJD2PjfB4Mtu1RWr5pkSCkSQ1hc6J4ztFZmAVpvi+ToTASlpEZ/+GJu1WP4RoFEiz6Vrqk/ZKaEmiZNx3zUD83FbLYgzYrH7yQfhbP4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793454313; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IA2zfU+elFDnFUhawKqcn+g6PD/rFJZaMV/qgUC1Ch4=; 
	b=WAD9taRwR+ehdUcZuwyq1fHrzlSOTc/eYpAMznpjbfEud4VaX1IA9Zt/4+GBp2H3xHGaTUwT9wF72eKqVhFbowKaxL+WEN3G8bxi+j9rA8JHrbi3B5lXVkyC6pmki18zML6qzbsWUAQ0M1n72S9qUUbY00loeCAWO2fNG6rGIy8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.dufresne@collabora.com;
	dmarc=pass header.from=<nicolas.dufresne@collabora.com>
DKIM-Signature: a=rsa-sha256; b=jzAu9FRJBaNSJ3AHilw2eWXauQJuC0SSmJh121wg9/CuUKZwl6srQeaaMXIDHfyzNyXmOCkbtSyKyJUSqJfDGHCGOHoBrlEzej4Q1/Ow3g6ZoFAt93aQdii1H8++3yJTzyjthijpIhccsjlCAb8N0K5iRvlMgdCYyVNauKzrbnA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=IA2zfU+elFDnFUhawKqcn+g6PD/rFJZaMV/qgUC1Ch4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1793454311209756.6514837174597; Sat, 31 Oct 2026 06:45:11 -0700 (PDT)
Date: Sat, 31 Oct 2026 09:45:11 -0400
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: <zhentao.guo@amlogic.com>
Cc: <wbieganski@baylibre.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <1a192350728.896283f8650321.6916105559730663215@collabora.com>
In-Reply-To: <31535217-e87d-4ef7-b22d-32c35ee998bb@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com> <179337024629.131241.9227206619077693683.b4-reply@b4> <1a18d5c5f7f.3e45f382588509.8172330954347509989@collabora.com> <31535217-e87d-4ef7-b22d-32c35ee998bb@amlogic.com>
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for
 S4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Normal
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_064517_136071_53B0EDA4 
X-CRM114-Status: UNSURE (   7.95  )
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


Hi Zhentao,

---- Le sam., 31 oct. 2026 00:51:29 -0400 zhentao.guo@amlogic.com a =C3=A9c=
rit ----

> > That reminded me, is that firmware in linux-firmware?
> This firmware is currently not in the repo of linux firmware. Should we
> merge the driver first, and then submit the blob to the firmware repo?



Thus far, we have always required the firmwares to land first, unless a str=
ong justification or valid alternative was proposed.


Nicolas

