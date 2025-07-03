Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D26DC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 17:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFFbXDp6C52Qp3ufM99aJcHE6kgv0crG6musmf5vcj0=; b=avCNAqwjFQs3fFwKuAB8Qk5p+L
	6t64i+jQdIlLcSPLfBdpOpxWIZWrSdMUW4YaKKU0Wkg0hmj/Bb4i9gWD7r83zj/xiAUqpipssCltT
	J22taOve8nqT0rgmm1AE9P8osE164FlgLWrFzgSj6zde4CggCLpdxYlwlpF8Bp8qf6e+cquMTCZ4n
	FxU04C4Os3EMJPwf6C36lptqTD2BiSu+QKnhOXphGlcWP71B2wHJSJey1Tw9rkJsMIcNblEjeqyTH
	cnQ1UcpLqdIB2xFy8wZUEYM3eh0oTKuJNapMshmpiHJi+NyqPW43OAhOWSDMNwmEzx2iUDIEoepWq
	jN6nGkGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNVo-0000000C6Co-0tEi;
	Thu, 03 Jul 2025 17:14:16 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXL3T-0000000Bh0b-2HVD;
	Thu, 03 Jul 2025 14:36:53 +0000
Received: from [141.14.220.36] (g36.guest.molgen.mpg.de [141.14.220.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9F6E3601D7115;
	Thu, 03 Jul 2025 16:35:33 +0200 (CEST)
Message-ID: <6be1c1c6-8d8a-49e3-bb14-dc8fcbfc2c50@molgen.mpg.de>
Date: Thu, 3 Jul 2025 16:35:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] Bluetooth: btrtl: Fix typo
To: Bastien Nocera <hadess@hadess.net>
References: <20250703142542.985248-1-hadess@hadess.net>
 <20250703142542.985248-4-hadess@hadess.net>
Content-Language: en-US
Cc: trivial@kernel.org, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Johan Hedberg <johan.hedberg@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Kees Cook <kees@kernel.org>, Erick Archer <erick.archer@outlook.com>,
 Chris Lu <chris.lu@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250703142542.985248-4-hadess@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_073651_723686_7AB865FE 
X-CRM114-Status: GOOD (  16.32  )
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

Dear Bastien,


Am 03.07.25 um 16:24 schrieb Bastien Nocera:
> Found by codespell.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>   drivers/bluetooth/btrtl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
> index 7838c89e529e..3d137944c458 100644
> --- a/drivers/bluetooth/btrtl.c
> +++ b/drivers/bluetooth/btrtl.c
> @@ -693,7 +693,7 @@ static int rtlbt_parse_firmware(struct hci_dev *hdev,
>   
>   	/* Loop from the end of the firmware parsing instructions, until
>   	 * we find an instruction that identifies the "project ID" for the
> -	 * hardware supported by this firwmare file.
> +	 * hardware supported by this firmwmare file.

Without the second m.

>   	 * Once we have that, we double-check that project_id is suitable
>   	 * for the hardware we are working with.
>   	 */


Kind regards,

Paul


PS: Should you resend, it’d be great if you wrote in the summary/title 
if it’s in a comment or in a log string.

