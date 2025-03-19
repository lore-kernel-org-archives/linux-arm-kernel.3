Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070FCC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsY55RCNGyHfx6aZMWvZi3TVmt7S40UABNFgJQXxiqk=; b=YqsE1Ngq3XQeNSgAF2S6Q98sQw
	9JCgiB1vwTlYAMwfI1UctEZ7bWTv6yUjsxNdLI2Cw6B6dkAEGNX4GwXX2CCPMiqB7YlXweYFRP8Lh
	fERgksB/OeO9HQ3OAuY7DqTcuUmTq2JcGIURKQI2RKRdyCzu3DBVjfGqDf8XmuAnWRbD2qzoWsxMC
	kEusNqmrjsHA8R0CrE6DDvE50ONCB2ZM6uKW746B15C31taz/pHYeZGYAZnTRStqhZpwLfX429ZZY
	lgda3qhNHGRLIKrpINWEexCnbEdr5WRygDtb2PKbRhm6LvJvO9m9+fkOY7KqS6EKgs5uCPs9S/Mns
	ktj4hCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tux0W-00000009fWN-2zNo;
	Wed, 19 Mar 2025 17:15:08 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwyn-00000009fAr-2SiR;
	Wed, 19 Mar 2025 17:13:23 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so69537081fa.2;
        Wed, 19 Mar 2025 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742404399; x=1743009199; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsY55RCNGyHfx6aZMWvZi3TVmt7S40UABNFgJQXxiqk=;
        b=IZkBHDjyuJcMJKSnvVGDs8h2V6EbUhZUwfrwPv1bmAJBabKgLtzaXMXZ+tj/vL0JKj
         9MsJ0cXn8KyqJJbGJrS2kDscftZkyZYOmUIHaEa2dfxpdWGd8GDhtH/oACSSqV6rs8GD
         PDwywodUg2GkxrGY7sAWdoJdilJVUdyGCfNXe1kvq63Mhqrj3/HaobT2msFTFmiDY/ka
         HOi4hQ4/EsQIKWUaDdhMLjaMhEUJZT5XL7tn5lAxC9mLbOnkLSU+9W1wUC4HwYbL2rT2
         pgDjKARC2FaCjTXlESirrrhq9s6kR+OIej5USc6D7J+6pwb5hjV3BkTQspbQ5KNs0IRe
         aYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742404399; x=1743009199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsY55RCNGyHfx6aZMWvZi3TVmt7S40UABNFgJQXxiqk=;
        b=sKObCef4Xrs2sMbM4YVX33rEQBdKnKrtAyODIc+nFhlsuiFlowDUM/HbsSOwlFcQo4
         owUm9vGKusn5o3MUeHc6XncvwsdFKyoH/b6geb7IAKPlO6tjETLG72y+tY5Utze/0dKJ
         9EsDQXm9ty8VBrqRlxoFAsSwPCKFxWRRa9rKb5d92bIq0ECp5SxTACqWiH7u6Qtzv//i
         Blbrgg6qK1CWKhiaj3vRE7kPxbWfOxgJJUArH4iYMpN7I0c1oJNqoeP3vKakxfBvv6YN
         RnvjDMJmYdpiuZjvKY6QcmIsvya0WI8lhVXpoYGmhvj/9uI+x9HFud60k+r1x+ZruN6m
         qa5A==
X-Forwarded-Encrypted: i=1; AJvYcCVcs1IuaivMC98i5CyT7EKDkatVxX/1CZztqGlVBN2NYSdELRRvPVOA53nZ7PpOF78CHQRLeB/sIIH0ob3trfQ=@lists.infradead.org, AJvYcCXySN8SfotZQ9l7hg80aGX58Iq/BzEV7XkX9EC2nYH7BtJ5LQe6QZxN3oHr8cujtoEr7Ult8lghqG6rOg/cr9R1@lists.infradead.org
X-Gm-Message-State: AOJu0YzK4qPzQA5IMOnoAECd7smn7/KaJkG+8Q7QT8i9iZOgvRwocQ2+
	R0+oCD9OmqRrCN9LIZUklcRQcXrekTGJrKr21Lxsstga3a5//fkNtj6KuH5y6eS5JHhjXjfMoS3
	p3pCpJvKShopeLGo8mbDroHo6MRE=
X-Gm-Gg: ASbGncub1q73YeTmR3FbRw+RZU+aZwqd1SQQYjONOlWRi5AQdKnXYiNSf2uzvBAwqoe
	vyAyp9xPVd1rfLfEHYUGFKG297/5kDMSxQfehZt1SlCKsCuGb6B8W3sB6+casX2oOU9cPR+suQY
	xHEzq9LLbv+I8DQSSp6UUv58QS
X-Google-Smtp-Source: AGHT+IF7eRn9Qqhav+r0W/aY/lFt1sOQv82hZIOgKM7eemFDpOso9Z0b+SPrjotbCDewAWU+h5BP24ocBqe0I2x6GR0=
X-Received: by 2002:a2e:b608:0:b0:30c:177c:9e64 with SMTP id
 38308e7fff4ca-30d6a44ba5dmr14153701fa.35.1742404398839; Wed, 19 Mar 2025
 10:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <2b612e2c1f4fa697b47b5dd9b72f1949d7c206f5.1742324401.git.calvin@wbinvd.org>
In-Reply-To: <2b612e2c1f4fa697b47b5dd9b72f1949d7c206f5.1742324401.git.calvin@wbinvd.org>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 19 Mar 2025 13:13:06 -0400
X-Gm-Features: AQ5f1JrFeLGkw9l24ev3Eh-rv0QrNx4gxklCjtOgd0nIm834e1eCZJ9mox2auDM
Message-ID: <CABBYNZ+ONkYtq2fR-8PtL3X-vetvJ0BdP4MTw9cNpjLDzG3HUQ@mail.gmail.com>
Subject: Re: [PATCH][QUESTION] bluetooth: Remove duplicated h4_recv_buf() in header
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, Amitkumar Karwar <amitkumar.karwar@nxp.com>, 
	Neeraj Kale <neeraj.sanjaykale@nxp.com>, linux-bluetooth@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_101321_630970_06B6397F 
X-CRM114-Status: GOOD (  41.83  )
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

Hi Calvin,

On Tue, Mar 18, 2025 at 3:31=E2=80=AFPM Calvin Owens <calvin@wbinvd.org> wr=
ote:
>
> Hello all,
>
> In the course of other debugging, I've discovered that h4_recv_buf() is
> almost completely duplicated in an inline header definiton, and I don't
> understand why.
>
> I'd like to clean this up: see the patch below for an explanation.
>
> Does anybody who was around at the time remember any more details about
> this? Or failing that, perhaps somebody with access to the bpa10x
> hardware can test it with the core function?

Don't think Ive been involved with kernel internals for this long to
give you an answer, but I assume it was due to alignment differences
in the drivers, but it looks like you could only find bpa10x, which
seems to be a usb driver for a single model (Tektronix BPA 100/105
(Digianswer)) and a quick google seem to refer to a protocol analyzer
for Bluetooth 2.1, so it is not really a regular Bluetooth controller.

> Thanks,
> Calvin
>
> ---8<---
> From: Calvin Owens <calvin@wbinvd.org>
> Subject: [PATCH] bluetooth: Remove duplicated h4_recv_buf() in header
>
> The "h4_recv.h" header contains a duplicate h4_recv_buf() that is nearly
> but not quite identical to the h4_recv_buf() in hci_h4.c.
>
> This duplicated header was added in commit 07eb96a5a7b0 ("Bluetooth:
> bpa10x: Use separate h4_recv_buf helper"). Unfortunately, there was no
> discussion about it on the list at the time:
>
>     https://lore.kernel.org/all/20180320181855.37297-1-marcel@holtmann.or=
g/
>     https://lore.kernel.org/all/20180324091954.73229-2-marcel@holtmann.or=
g/
>
> This is the diff between the two implementations as they exist today:
>
>     --- /home/calvinow/orig.c   2025-03-10 14:43:18.383882623 -0700
>     +++ /home/calvinow/copy.c   2025-03-10 14:42:57.109953576 -0700
>     @@ -1,117 +1,100 @@
>      {
>     -   struct hci_uart *hu =3D hci_get_drvdata(hdev);
>     -   u8 alignment =3D hu->alignment ? hu->alignment : 1;
>     -
>         /* Check for error from previous call */
>         if (IS_ERR(skb))
>                 skb =3D NULL;
>
>         while (count) {
>                 int i, len;
>
>     -           /* remove padding bytes from buffer */
>     -           for (; hu->padding && count > 0; hu->padding--) {
>     -                   count--;
>     -                   buffer++;
>     -           }
>     -           if (!count)
>     -                   break;
>     -
>                 if (!skb) {
>                         for (i =3D 0; i < pkts_count; i++) {
>                                 if (buffer[0] !=3D (&pkts[i])->type)
>                                         continue;
>
>                                 skb =3D bt_skb_alloc((&pkts[i])->maxlen,
>                                                    GFP_ATOMIC);
>                                 if (!skb)
>                                         return ERR_PTR(-ENOMEM);
>
>                                 hci_skb_pkt_type(skb) =3D (&pkts[i])->typ=
e;
>                                 hci_skb_expect(skb) =3D (&pkts[i])->hlen;
>                                 break;
>                         }
>
>                         /* Check for invalid packet type */
>                         if (!skb)
>                                 return ERR_PTR(-EILSEQ);
>
>                         count -=3D 1;
>                         buffer +=3D 1;
>                 }
>
>                 len =3D min_t(uint, hci_skb_expect(skb) - skb->len, count=
);
>                 skb_put_data(skb, buffer, len);
>
>                 count -=3D len;
>                 buffer +=3D len;
>
>                 /* Check for partial packet */
>                 if (skb->len < hci_skb_expect(skb))
>                         continue;
>
>                 for (i =3D 0; i < pkts_count; i++) {
>                         if (hci_skb_pkt_type(skb) =3D=3D (&pkts[i])->type=
)
>                                 break;
>                 }
>
>                 if (i >=3D pkts_count) {
>                         kfree_skb(skb);
>                         return ERR_PTR(-EILSEQ);
>                 }
>
>                 if (skb->len =3D=3D (&pkts[i])->hlen) {
>                         u16 dlen;
>
>                         switch ((&pkts[i])->lsize) {
>                         case 0:
>                                 /* No variable data length */
>                                 dlen =3D 0;
>                                 break;
>                         case 1:
>                                 /* Single octet variable length */
>                                 dlen =3D skb->data[(&pkts[i])->loff];
>                                 hci_skb_expect(skb) +=3D dlen;
>
>                                 if (skb_tailroom(skb) < dlen) {
>                                         kfree_skb(skb);
>                                         return ERR_PTR(-EMSGSIZE);
>                                 }
>                                 break;
>                         case 2:
>                                 /* Double octet variable length */
>                                 dlen =3D get_unaligned_le16(skb->data +
>                                                           (&pkts[i])->lof=
f);
>                                 hci_skb_expect(skb) +=3D dlen;
>
>                                 if (skb_tailroom(skb) < dlen) {
>                                         kfree_skb(skb);
>                                         return ERR_PTR(-EMSGSIZE);
>                                 }
>                                 break;
>                         default:
>                                 /* Unsupported variable length */
>                                 kfree_skb(skb);
>                                 return ERR_PTR(-EILSEQ);
>                         }
>
>                         if (!dlen) {
>     -                           hu->padding =3D (skb->len + 1) % alignmen=
t;
>     -                           hu->padding =3D (alignment - hu->padding)=
 % alignment;
>     -
>                                 /* No more data, complete frame */
>                                 (&pkts[i])->recv(hdev, skb);
>                                 skb =3D NULL;
>                         }
>                 } else {
>     -                   hu->padding =3D (skb->len + 1) % alignment;
>     -                   hu->padding =3D (alignment - hu->padding) % align=
ment;
>     -
>                         /* Complete frame */
>                         (&pkts[i])->recv(hdev, skb);
>                         skb =3D NULL;
>                 }
>         }
>
>         return skb;
>      }
>
> It seems fairly obvious from the above that, if alignment is one,
> hu->padding is always zero, and in that case the two functions behave
> strictly identically.
>
> Since that is the case for every driver except hci_nokia, clean this up
> and let them use the core function. I've done some light testing on
> btnxpuart, so far everything seems to work.
>
> I would love to eliminate the duplicate function entirely, but I don't
> have access to hardware for bpa10x. Since bpa10x breaking was the
> original justification for the change, I've left it there for now. I'm
> hoping somebody else can shed more light on this.
>
> Cc: Marcel Holtmann <marcel@holtmann.org>
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>  drivers/bluetooth/btmtksdio.c | 2 +-
>  drivers/bluetooth/btmtkuart.c | 2 +-
>  drivers/bluetooth/btnxpuart.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.=
c
> index bd5464bde174..47d1073fb4a4 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -29,7 +29,7 @@
>  #include <net/bluetooth/bluetooth.h>
>  #include <net/bluetooth/hci_core.h>
>
> -#include "h4_recv.h"
> +#include "hci_uart.h"
>  #include "btmtk.h"
>
>  #define VERSION "0.1"
> diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.=
c
> index c97e260fcb0c..aeb111a0f242 100644
> --- a/drivers/bluetooth/btmtkuart.c
> +++ b/drivers/bluetooth/btmtkuart.c
> @@ -27,7 +27,7 @@
>  #include <net/bluetooth/bluetooth.h>
>  #include <net/bluetooth/hci_core.h>
>
> -#include "h4_recv.h"
> +#include "hci_uart.h"
>  #include "btmtk.h"
>
>  #define VERSION "0.2"
> diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.=
c
> index aa5ec1d444a9..e6db563088cb 100644
> --- a/drivers/bluetooth/btnxpuart.c
> +++ b/drivers/bluetooth/btnxpuart.c
> @@ -21,7 +21,7 @@
>  #include <net/bluetooth/bluetooth.h>
>  #include <net/bluetooth/hci_core.h>
>
> -#include "h4_recv.h"
> +#include "hci_uart.h"
>
>  #define MANUFACTURER_NXP               37
>
> --
> 2.47.2
>


--=20
Luiz Augusto von Dentz

