Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16B7C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:To:
	Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbLKuNOVurWKtK4oUnqVUqNVImgpQxoJDSpLuja+PYM=; b=SpnU8T4+XpbJcoyK8a1PqO4Siv
	0sq03d4H/JanSNtKKO6fnZtEjYRb4IFUdcclue7rmwF0TXnmXRmccwTxVFVQbWb0usrrwtaWhd+rA
	EQRN9M6SwX5w5cEADj0mKa/n3grQlPV05e/pZrcXQDE+k+GKVT7ww9ySKk7O8QKTwOxNLimBt+qWu
	PTfaB8rPIPivvNdLwpwpQfydhdWIH6llXZ/Z6F9P6eV4quXwW1Mq3+Pzu5lfRTrh8sUvTE9DkrdBD
	O8rWLqEP9JIItQoxiE1MqMhMYEgvdK2KYmVC2MULXGP/VO6BIto6HRjYUs+lSwZQTibcdimvP9hNa
	lHSmO9Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCyU-0000000El3w-0a8G;
	Fri, 11 Jul 2025 12:35:34 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCum-0000000Ekdy-3dkh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:31:46 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752237092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jbLKuNOVurWKtK4oUnqVUqNVImgpQxoJDSpLuja+PYM=;
	b=M24FBhjLkVSWkRYyqjg/YQ4GGhqyackjFl259cMwBWczjuvJQrzu25iMs7BHqNB/MJKwuD
	YA12G3wwbCOSSh0EfiBkIrSQLYbpgMWmozVf6/p3Ot9yfj8lZu0QNDvO3RWOoV6zepSMCB
	uNN4PkSJGJoHf//JXrNkdy9a0Z8nHrQ=
Date: Fri, 11 Jul 2025 12:31:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <6910cf379fafc80a921daf5b9321550eff37c1b1@linux.dev>
TLS-Required: No
Subject: Re: Aw: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: add
 mt7988 lvts commands
To: "Mason Chang" <mason-cw.chang@mediatek.com>, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Nicolas Prado" <nfraprado@collabora.com>, jpanis@baylibre.com,
 npitre@baylibre.com, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, wenst@chromium.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, "Frank Wunderlich" <frank-w@public-files.de>,
 "Steven  Liu" <steven.liu@mediatek.com>, "Sam Shih"
 <Sam.Shih@mediatek.com>
In-Reply-To: <b014c34a560854e6dd6a6dd483b9443f42252b51.camel@mediatek.com>
References: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
 <trinity-e9eaf8fd-42f1-46d5-b1df-3bfefe02b2fe-1750057280436@trinity-msg-rest-gmx-gmx-live-b647dc579-tr2th>
 <b014c34a560854e6dd6a6dd483b9443f42252b51.camel@mediatek.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_053145_040628_11FB78C3 
X-CRM114-Status: GOOD (  11.98  )
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

Hi,

i finally found someone for testing this as it only affects ~2% the mt798=
8 users:

https://github.com/frank-w/BPI-Router-Images/issues/16#issuecomment-30619=
76373

so can you please review and add it to mainline?

regards Frank


Am 8. Juli 2025 um 13:56 schrieb "Mason Chang" <mason-cw.chang@mediatek.c=
om>:

>=20
>=20On Mon, 2025-06-16 at 07:01 +0000, Frank Wunderlich wrote:
>=20
>=20>=20
>=20> External email : Please do not click links or open attachments unti=
l
> >=20
>=20>  you have verified the sender or the content.
> >=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  Gesendet: Montag, 26. Mai 2025 um 12:26
> >=20
>=20>  Von: "Mason Chang" <mason-cw.chang@mediatek.com>
> >=20
>=20>  Betreff: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: add
> >=20
>=20>  mt7988 lvts commands
> >=20
>=20>=20=20
>=20>=20
>=20>  Add the LVTS commands for Mediatek Filogic 880/MT7988.
> >=20
>=20>=20=20
>=20>=20
>=20>  This series fixes severely abnormal and inaccurate LVTS temperatur=
e
> >=20
>=20>  readings when using the default commands.
> >=20
>=20>=20=20
>=20>=20
>=20>  Signed-off-by: Mason Chang <mason-cw.chang@mediatek.com>
> >=20
>=20>=20=20
>=20>=20
>=20>  Hi
> >=20
>=20>=20=20
>=20>=20
>=20>  just a friedly reminder for maintainers, is the patch series ok or
> >=20
>=20>  does it need any changes?
> >=20
>=20>=20=20
>=20>=20
>=20>  regards Frank
> >=20
>=20
> Hi all,
>=20
>=20I submitted the patch a while ago, but haven't received any response
>=20
>=20from the maintainer yet. I would really appreciate it if any maintain=
er
>=20
>=20could take a look or provide some comments.
>=20
>=20If there is a more appropriate maintainer or reviewer for this patch,
>=20
>=20please kindly let me know or help forward it.
>=20
>=20Thank you very much for your time and help!
>=20
>=20Sincerely,
>=20
>=20Mason
>

