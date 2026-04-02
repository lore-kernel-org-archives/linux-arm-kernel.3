Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91519D6AAE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 15:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18pYQahmcGP5O3MNZCkLmQTs3eCeQFVHjRELcNHzfl8=; b=026hosQybNIZoqvBklXOjt5Qw5
	AZYfgMe+ADF0u2BJ/d5fmw/weJcAL8qMdMi2ieq1V6wFn/v/5rUlHHnz4llin1/tNumZL2APXRK+p
	QiRluDvr6AZt34MIZniecxyDGfeG334FSwjOCxB3N1xvQZ0/Jo8osTnAIzmcZFn0sRY6blaHe+Zxo
	mnDfn7j3G6aN2p6f59+SlTrgtPKIo5VphYkz5d0TDCJUR5cNAuKM0n4FbEMAcBtBQN9sk6pMry3SI
	OAwZrQ0usVynMTBWioI6i41Rkj2lY8nIYUXUmdJ4ypdidSPM0GWAQZ7PZDj5nRHkA76WKWzdY2zEN
	WTkR2EUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KBN-00000000SNG-0Wgv;
	Thu, 02 Apr 2026 15:42:09 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KBJ-00000000SM8-3W1a;
	Thu, 02 Apr 2026 15:42:07 +0000
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 307064C2C37D49;
	Thu, 02 Apr 2026 17:41:27 +0200 (CEST)
Message-ID: <4736768a-e391-4f70-9821-7386efedf3b3@molgen.mpg.de>
Date: Thu, 2 Apr 2026 17:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btmtk: hide unused btmtk_mt6639_devs[] array
To: Arnd Bergmann <arnd@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Javier Tia <floss@jetm.me>, Arnd Bergmann <arnd@arndb.de>,
 Chris Lu <chris.lu@mediatek.com>, Kees Cook <kees@kernel.org>,
 Johan Hovold <johan@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Jiande Lu <jiande.lu@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260402141119.2732591-1-arnd@kernel.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260402141119.2732591-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_084206_033419_75856B8E 
X-CRM114-Status: GOOD (  17.96  )
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

Dear Arnd,


Thank you for your patch.

Am 02.04.26 um 16:11 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When USB support is disabled, the array is not referenced anywhere,
> causing a warning:
> 
> drivers/bluetooth/btmtk.c:35:3: error: 'btmtk_mt6639_devs' defined but not used [-Werror=unused-const-variable=]
>     35 | } btmtk_mt6639_devs[] = {
>        |   ^~~~~~~~~~~~~~~~~
> 
> Move it into the #ifdef block.
> 
> Fixes: 4cdd001ff03f ("Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/bluetooth/btmtk.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 099188bf772e..6fb6ca274808 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -25,22 +25,6 @@
>   /* It is for mt79xx iso data transmission setting */
>   #define MTK_ISO_THRESHOLD	264
>   
> -/* Known MT6639 (MT7927) Bluetooth USB devices.
> - * Used to scope the zero-CHIPID workaround to real MT6639 hardware,
> - * since some boards return 0x0000 from the MMIO chip ID register.
> - */
> -static const struct {
> -	u16 vendor;
> -	u16 product;
> -} btmtk_mt6639_devs[] = {
> -	{ 0x0489, 0xe13a },	/* ASUS ROG Crosshair X870E Hero */
> -	{ 0x0489, 0xe0fa },	/* Lenovo Legion Pro 7 16ARX9 */
> -	{ 0x0489, 0xe10f },	/* Gigabyte Z790 AORUS MASTER X */
> -	{ 0x0489, 0xe110 },	/* MSI X870E Ace Max */
> -	{ 0x0489, 0xe116 },	/* TP-Link Archer TBE550E */
> -	{ 0x13d3, 0x3588 },	/* ASUS ROG STRIX X870E-E */
> -};
> -
>   struct btmtk_patch_header {
>   	u8 datetime[16];
>   	u8 platform[4];
> @@ -483,6 +467,22 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
>   EXPORT_SYMBOL_GPL(btmtk_process_coredump);
>   
>   #if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
> +/* Known MT6639 (MT7927) Bluetooth USB devices.
> + * Used to scope the zero-CHIPID workaround to real MT6639 hardware,
> + * since some boards return 0x0000 from the MMIO chip ID register.
> + */
> +static const struct {
> +	u16 vendor;
> +	u16 product;
> +} btmtk_mt6639_devs[] = {
> +	{ 0x0489, 0xe13a },	/* ASUS ROG Crosshair X870E Hero */
> +	{ 0x0489, 0xe0fa },	/* Lenovo Legion Pro 7 16ARX9 */
> +	{ 0x0489, 0xe10f },	/* Gigabyte Z790 AORUS MASTER X */
> +	{ 0x0489, 0xe110 },	/* MSI X870E Ace Max */
> +	{ 0x0489, 0xe116 },	/* TP-Link Archer TBE550E */
> +	{ 0x13d3, 0x3588 },	/* ASUS ROG STRIX X870E-E */
> +};
> +
>   static void btmtk_usb_wmt_recv(struct urb *urb)
>   {
>   	struct hci_dev *hdev = urb->context;

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

