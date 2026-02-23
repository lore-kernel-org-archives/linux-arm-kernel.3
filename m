Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDB0EA4FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8fTPdqPNcGyUCnWkfcfNwJdNZg9S+EhOyOa4t7Mzgg=; b=32UNbKmJme4wmHp3nFQLxiO8Ja
	FOuOoGZYYt+OztYVZVssVM9bMTOhgN+Z07vN3dI1qiZd6rCwsttO1FRllB+p1f1ehQJUWouPBEu1B
	WGbZUQjM1P6eV5UgExd1XQ4aINgSjieXFyoiuHukQzw4V7Pfar8Wv3lMnl6k8BDAzvef88CMn6mpZ
	w3GhnJTVWjuveyyeLtC/yWEOAgI54l5D01uxdM8fiEgwIvq5qGIHUbJu65lq4o13hlgltBWYBtK8/
	9DXpUKKoSdQSPlNvpwxefteC7yMtWhyGrJRNtrT4CAXYAFYb47ZqfQPYJTHwSeqyXVz+8BWYASRdB
	E8HGmQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXVc-00000000Xri-1JRd;
	Mon, 23 Feb 2026 15:06:04 +0000
Received: from mail.toke.dk ([2a0c:4d80:42:2001::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXVY-00000000Xqp-2xLb;
	Mon, 23 Feb 2026 15:06:02 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1771859152; bh=kGKSxwViJNEQK73vs8QsyLAdrnwEw06os2axu0yWn0s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Brc5TSLHZtc1BvrhQschbZCiFB04Sq+ang3eIqACvYTKEfekOuUgqV1MeRKuLa6wU
	 8SO5v9i81x6ry2xPzsJbetFEBKVKlhyKviRtCtfJkSElMvMBp79pykJXmNiZ15K8Kl
	 Rq/jsDjb3AEnMVt1bMjYRqxwjEpYyAEkKCAJ+1yxRmtc3bZWMXymDhCN+Getv/zx5Y
	 Kzuj0Xmq97uc8mLVKW2NWx5vI6DK5BcPFc4c6jiVjRTfiRQyAlhlAiTZDDsJRexo/u
	 EpAQEcv2+ja5lVvrrKr3gl8tyNOPk7qqjIkxFJWj08aUCN2pKR0ClTpe6kZv+B1Ej8
	 WBAIhT3vkIAgw==
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan
 Sadhasivam
 <mani@kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ACTIONS SEMI
 ARCHITECTURE" <linux-actions@lists.infradead.org>
Subject: Re: [PATCH ath-next] wifi: ath9k: simplify eeprom format strings
In-Reply-To: <20250821033908.638871-1-rosenp@gmail.com>
References: <20250821033908.638871-1-rosenp@gmail.com>
Date: Mon, 23 Feb 2026 16:05:54 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <874in7o5yl.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_070601_191116_127B6562 
X-CRM114-Status: GOOD (  16.82  )
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

Rosen Penev <rosenp@gmail.com> writes:

> devm is already used here so might as well simplify the whole function
> with devm_kasprintf.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

(sorry for not getting around to replying to this before)

> ---
>  drivers/net/wireless/ath/ath9k/ath9k.h                |  2 +-
>  drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c | 11 +----------
>  drivers/net/wireless/ath/ath9k/init.c                 |  7 +++----
>  drivers/net/wireless/ath/ath9k/rng.c                  |  4 ++--
>  4 files changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath9k/ath9k.h b/drivers/net/wireless/ath/ath9k/ath9k.h
> index 6e38aa7351e3..60aac2c50409 100644
> --- a/drivers/net/wireless/ath/ath9k/ath9k.h
> +++ b/drivers/net/wireless/ath/ath9k/ath9k.h
> @@ -1076,7 +1076,7 @@ struct ath_softc {
>  #ifdef CONFIG_ATH9K_HWRNG
>  	struct hwrng rng_ops;
>  	u32 rng_last;
> -	char rng_name[sizeof("ath9k_65535")];
> +	const char *rng_name;

Changing this fixed buffer to a devm-managed pointer makes no sense: it
doesn't help with any lifetime issues, and just adds overhead.

>  #endif
>  };
>  
> diff --git a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
> index fe1013a3a588..c4f8d1f98369 100644
> --- a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
> +++ b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
> @@ -140,19 +140,10 @@ static void owl_fw_cb(const struct firmware *fw, void *context)
>  static const char *owl_get_eeprom_name(struct pci_dev *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	char *eeprom_name;
>  
>  	dev_dbg(dev, "using auto-generated eeprom filename\n");
>  
> -	eeprom_name = devm_kzalloc(dev, EEPROM_FILENAME_LEN, GFP_KERNEL);
> -	if (!eeprom_name)
> -		return NULL;
> -
> -	/* this should match the pattern used in ath9k/init.c */
> -	scnprintf(eeprom_name, EEPROM_FILENAME_LEN, "ath9k-eeprom-pci-%s.bin",
> -		  dev_name(dev));
> -
> -	return eeprom_name;
> +	return devm_kasprintf(dev, GFP_KERNEL, "ath9k-eeprom-pci-%s.bin", dev_name(dev));

This change sort of makes sense, given that devm is already used. But
really, it shouldn't be; the name is only used to pass it to
request_firmware_nowait(), so the devm management is totally
superfluous. Better to change it to an on-stack buffer like the other
call instead (maybe just by getting rid of the owl_get_eeprom_name()
helper entirely, and moving the scnprintf() into the caller).

>  }
>  
>  static void owl_nvmem_work(struct work_struct *work)
> diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
> index ee951493e993..04903b5c611f 100644
> --- a/drivers/net/wireless/ath/ath9k/init.c
> +++ b/drivers/net/wireless/ath/ath9k/init.c
> @@ -625,7 +625,7 @@ static int ath9k_of_init(struct ath_softc *sc)
>  	struct ath_hw *ah = sc->sc_ah;
>  	struct ath_common *common = ath9k_hw_common(ah);
>  	enum ath_bus_type bus_type = common->bus_ops->ath_bus_type;
> -	char eeprom_name[100];
> +	const char *eeprom_name;

Changing an on-stack buffer to a devm-managed one also doesn't make any
sense.

-Toke

