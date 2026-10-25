Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4766A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M6/c9bjZ;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=d+uwkHDw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1vvzv/rSvfcKw30uzKsTe1KIP0FW6HAKpvirU0JdiVE=; b=M6/c9bjZm6Cip8
	siXsRKg/Amoib58zhBMXvB48LGw/12+lFmrHMmAT4MApV6MrHsGiRd1WDPk+rD49ZQ4WlslRuQ5dv
	yqYVkV+uPWgcbqcYjbwzs2Zb0wjvaFEQfe11r92i8Lwh0qTFGCKBcHeY+wn/gP0HCQxeTMzzYE9FW
	/rQlqwwbBEd5tz/JNOx+E07oS9fAndueQCrifR2caAbCG7bMavIo3r5ugqs82qdilIDQ8rwpmYjZI
	NycxPrHYjB/7P1S/8LGLkTsRU2Ip/d06ZW0WP7Qw++C+Cm4HQQ1Txu2L/V5giZXm09j0oClxmLobd
	+lga8Sk6gj9RnWJFlepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKwdA-000000010Ts-2ocR;
	Sun, 25 Oct 2026 11:43:16 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKwd7-000000010TC-2pCm;
	Sun, 25 Oct 2026 11:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1792928575; x=1793533375; i=markus.elfring@web.de;
	bh=1vvzv/rSvfcKw30uzKsTe1KIP0FW6HAKpvirU0JdiVE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=d+uwkHDwqkM6pHE2/U6ObctDchWmW0l5SNC2Xba/IMsAM3dGzsCzEXILDZW5irYH
	 C/xLdNSSNJGKTU9q00KQXVpKVDJJ3dq5PBEfRFskE4C+cMu5/q6F2CRVoJ3F5mvKA
	 AZsW3cLNYSzoWlK7sDq+iulHcsK+ae5nLeEfi2VvT57Auvtx2eEHtfiglQT+Y5xQB
	 gPb27vUndBB9COZgR6xJ2nVlzkYzYtTrzLohD6fhtGxJ81AXGUo+xAw+MqC+wYrNI
	 vTdLcO7M9f/Yyad1MA8XetHcb4WXMhHFYZUWX/IvIQ+bwXgs5RnHDRYc+VVxI5K+3
	 iwtH9/ozJ89q7i+V1Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCGWe-1xUG0z0GG2-009Od2; Sun, 25
 Oct 2026 12:42:55 +0100
Message-ID: <230b2dd8-8d8f-4b1c-ac9f-2c1eac636751@web.de>
Date: Sun, 25 Oct 2026 12:42:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: soc: mediatek: SVS: fix device reference leak in
 svs_add_device_link()
To: Coia Prant <coiaprant@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Roger Lu <roger.lu@mediatek.com>
References: <20261023082948.1854252-1-coiaprant@gmail.com>
 <fa60e7c4-d8ca-4ff4-a56f-6a6e2bfbf3cf@web.de>
 <9AE974CC-F342-42F0-84A3-D72C3A0326C2@gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9AE974CC-F342-42F0-84A3-D72C3A0326C2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:skHlHJ52nOfkhJUnuDm/lCGTAMm/nvoD7frVFUZFgKpKWz71nbo
 dPATAgOF4g0CcWWmhVafttYOyBt5iKXP1spYoBfILepSp9u0M7z6tbAPqNS7IHZ4rV4sNvj
 RKmH5jU3dS11w6ZdXaL3B4IbB/ZqvSygGwKGOwDTuHg0U/o1wKjYlclGqrwYo76vm/cquPG
 F0IzHh+pZK64RqMndqjNA==
UI-OutboundReport: notjunk:1;M01:P0:IcwVGQBRHOo=;MR2U4Q31JMpEzXkSVkSHz+X3XZ9 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_044314_080081_7C21FAD0 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

=E2=80=A6
> __free(), DEFINE_FREE() and return_ptr() only appeared in v6.5, while
> this driver dates back to v5.19 and the fix is tagged for stable (first
> LTS is v6.1). Converting to scope-based cleanup here would not compile
> on 6.1.y and would force the stable team to rewrite the backport.
>=20
> So I'd prefer to keep the explicit put_device() in this patch and leave
> the __free(put_device) conversion to whoever owns the driver, as a
> separate cleanup when the stable backport is no longer a concern.

Would you eventually like to become more involved with corresponding
source code transformations?

Regards,
Markus

