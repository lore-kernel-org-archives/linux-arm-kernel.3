Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622BF606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tMtTxqt7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wUtxsyce
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FQAPIWMbbJdCSrqpLgLYAqpkKK9TOoJ/Jv2La7z0jSE=; b=tMtTxqt7R3LL1C
	STqPEH2d9lQkUJMV3Xcga4Os7ohVW/dnNx8hEMCiMUNFyhkDNm3nZWFnv236tsXPKQuLNjfPcjGUD
	6j6l7FhLedOGc8rWdal5+3fpoH2GuZxBwGUXWhsIXM5cwj844eUSIcqiwfEYl2gW2vMuqGgB07Psn
	O7hN289+LurDSQrQhtx0EQ5+FavPOcZ6ESLuJnzEp7BIdid7Wmr/Ipgtb2H8JvNexPmvvP/+yaC3K
	C9PAMcrzdVb90ye1lZwXp7yL6sSb+uNJIyd4Bvx2bVCosF35ARYnwdx1qNbJZomkmyDTwwiImv5N1
	P7oF9GaT7S7+hx8x8VNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcrI-00000005m2T-2Xrx;
	Wed, 04 Nov 2026 15:25:04 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcrG-00000005m1m-0yKf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:25:03 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-845f3fa7f38so325400a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 07:25:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805901; cv=none;
        d=google.com; s=arc-20260327;
        b=QEGvYpWFXFLnuJTYp2tBT5tZKgm/1Aw4rTApBzEmabnznYtgnOdzdXNz6l6kIaHb+X
         s5Vfys8gPDdOtSZHxFY36DjWnpKABufXXUuQfoNlmH02T0a2Qi9VaiqnKvZWfQhYXAA/
         +nXNY/qEIHUQTuNkxpv505krAMntf4UxWWM1FmZoh+CwcVKZDWMM9x/3+tUVn9VspThO
         aP5rH3fQ24A8YtsIl0TAbhaTQrK8B0Dps2bVo7pzxtK/S6Wt7hM7pIE0xCOELGJAX0+T
         778Wfhisgt1tJIUjce7XS9mLrDM/7IhwiEnARfRBWdcdNH13svOwsDBdGpcedbjzWuKg
         etNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FQAPIWMbbJdCSrqpLgLYAqpkKK9TOoJ/Jv2La7z0jSE=;
        fh=vZ4WH2ODTnikvC8cD9dvu/AFnTE+37Xbx9JsUgt0Pho=;
        b=VTo/Lsta6uWuHbjJXB1gqT6zcWOyvOApbnGaHZ9nlUlPgLAPzZXsk1QzvG72kgrTCk
         fZQ5JCg6cu8KVMJ498UvgVAX4OdJ3isTf1ML6pSi1+Wwtpwa9lqiW9AmBNNS0YgKhDU5
         Zj/fG5B/Luj0mQu/uEMWhQu044SU///V20jXvYK/B/8iUlsROc1PIFyPjhuXooDbgfaq
         pB88nbZGVSDfTH5kD2O9TH0DD9nfcKVJqWvSABlNM6eLjZcfKKTHiKui2mKFMsY7KXxJ
         oMaK+wiSrtneX/4V3JukFaFYXZGH4S4hEit0Esv1FPI++f01ZXhgf3ZEkiEuBodVAAmr
         7wWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805901; x=1794410701; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FQAPIWMbbJdCSrqpLgLYAqpkKK9TOoJ/Jv2La7z0jSE=;
        b=wUtxsyceerZDsbIkryQh5+A7pzxfUn6N5r6q/sEUZ0E3ygOSCWpkZnU88nG/G0KKZL
         +o+Hyt4Q99qbMUpK+Ul5RPIXHwekbrNfnrjH8gKnIefb6dxQQ8a8VW+EKle1Q8ik+luJ
         FlUpcBL37tLy+ZEEk2d2WvNPU+kvTXUWZzc2XB6rtr2bITmDiHYp5szCODojYr3QNh22
         2gKGUXV1xSOkkEfHIjYZNXEHBIktikapBz9o0cK3upBEqqNWT/xX1uRY0zhkXFcU0kCY
         ygdfNlzfu08Npmua05m8pUPJvsAxp/55zAZ+XuM7pT3Xt55xoAcKfpCrSnQio9nF0ZP9
         p09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805901; x=1794410701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQAPIWMbbJdCSrqpLgLYAqpkKK9TOoJ/Jv2La7z0jSE=;
        b=MJ4D72EF/HgOSaAovQ6T37xq8D0hBHFgMd9BUOIgnaysn48h4myJ33KfggY1vmNK5A
         iIh8FtCu0e0WROpVPfG1OK3BWaiwqEHx26bcx4J30SjEx/tKPRYPod48iPOVCMLcQSgL
         NXnUpsjoAql/HypirpVAVtUSTCX4cyLEhJF5uCmvctr7gzzhcWCXZYpefwiW3I6w7GwT
         qJqUox3KPUPwcZI2gbiD5pldcWI95LXXJH/11R9r/lxeTojNLaxEfk/OKXCq7sZSnsQn
         YqSPOSsZyojPaa8cavoQclbenOIKsx0wuVCHho8/s4Rb3QxRk4Q3bkWrjnadfOkLNpTU
         NU9A==
X-Forwarded-Encrypted: i=1; AKwUvBx+YsQmYLaQqao2tLxwGoKpZ5Fn+Np+tAWCIQAF1+hTJ7AYUcpCd3B9ALsQSxdDC/jMPgxqg8+/QMagpGWlUy7G@lists.infradead.org
X-Gm-Message-State: APuU4Z/dbECJFcqgrBvH28H25OAtc/D3GaM8MgQIgFL/q2i/Spnyz5M2
	5kb7gSi8PdYmNCObvuDfmQU60l1QErIOW0ypO/E3qWUxSP+UZ7Mqvo7G/PeVjxXG6XvR+Da0jKb
	qk6Jyco07x50z5/tj5UZf/5F3nR1OIMg=
X-Gm-Gg: AYBFou2qxJPhdTwG68tasYwhyOAilH5mOwcSwlNBujLItbTVLmUSFTLG+fNv67Bf84d
	vON3C0LSnuSdh8EMVb0BmtZ5b2XabG7kXOfapk7+3a5hiMMqs5QDeS08xGH36Hbg8tVoylQCOoe
	M+UIOUCRT2eEavEhjvDtKnxKK7pqG7oY8uJCXsSJQD5uBOa/H2iD4P72qMtmgSxB8sO5YaIpS1v
	9pG1S8ttNTtUCXYwIIqPNt7VL04BTO7dif0DqsSprk3Ta0EIk+EzDrmVoPNCb6Ng25zn6VeehXi
	Ut0Ozn98jiUA/ZkvhiEoPDerpfEAkcOPJFWQrXyjUNyw5k5WkzBkPTKG/rPonviR33Iu9ANypGL
	tLXEEJlllcAtSbhrFwtoHGhLnj+2/E5R9upJ4rzKrqd79RwDwV3y6Lsv25e305pjxarmkWg6G7o
	nf0IyS/9NpLKs6ERjcZcVwGXOzgQk7EDsL9noUuAz/jfb4h/DwteAlTls+
X-Received: by 2002:a05:6808:23d3:b0:552:2c0b:905f with SMTP id
 5614622812f47-5640dc2c531mr11109420b6e.10.1793805900632; Wed, 04 Nov 2026
 07:25:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104151601.70493-1-dev@deq.rocks> <20261104151601.70493-3-dev@deq.rocks>
In-Reply-To: <20261104151601.70493-3-dev@deq.rocks>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 4 Nov 2026 10:24:47 -0500
X-Gm-Features: AclHuK8hxLtpKa8aXaTi7mu-MijqC4C86dfWCBKmhN_R5OdoXiTiEBf1-KSgMMk
Message-ID: <CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com>
Subject: Re: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE advertising
 report types
To: Andre Eikmeyer <dev@deq.rocks>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net, neal@gompa.dev, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	66ton99@gmail.com, josemiguelo.ochoa@gmail.com, aditya.garg@linux.dev, 
	Yossef Osman <Yossef.Osman@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_072502_285769_63F3E4DE 
X-CRM114-Status: GOOD (  28.00  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre,

On Wed, Nov 4, 2026 at 10:16=E2=80=AFAM Andre Eikmeyer <dev@deq.rocks> wrot=
e:
>
> The BCM4364B0 of the MacBookPro15,1 (UART) and the BCM4377 of the
> MacBookAir9,1 (PCIe) set bits 4, 5 and 7 of the event type in LE
> Advertising Report events. btmon on the 15,1 shows types 0x10, 0x13,
> 0x14, 0x20, 0x23, 0x24, 0x93 and 0xa0 next to plain 0x00, 0x03 and 0x04,
> the same advertiser shows up as 0x13, 0x23 and 0x03. The kernel log of
> the 9,1 lists 0x10 to 0x24 and 0x80, 0x83, 0x90, 0x93, 0xa0, 0xa3.
> process_adv_report() drops every type above 0x04 with "Unknown
> advertising packet type", so most advertisements never reach the host.
> An AirDrop sender was reported as 0x23, 0x23 and 0x13 and only the
> fourth report, 0x03, reached BlueZ 32 s after the first one.
>
> Add btbcm_fixup_le_adv_report(), which clears the bits above the type,
> and call it from hci_bcm on Apple machines and from hci_bcm4377 before
> the event goes to the core.
>
> Suggested-by: Jose Miguel Ochoa <josemiguelo.ochoa@gmail.com>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/bluetooth/btbcm.c       | 30 ++++++++++++++++++++++++++++++
>  drivers/bluetooth/btbcm.h       |  5 +++++
>  drivers/bluetooth/hci_bcm.c     |  5 +++++
>  drivers/bluetooth/hci_bcm4377.c |  1 +
>  4 files changed, 41 insertions(+)
>
> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> index 0facfe62333..527a5c75fd6 100644
> --- a/drivers/bluetooth/btbcm.c
> +++ b/drivers/bluetooth/btbcm.c
> @@ -282,6 +282,36 @@ void btbcm_set_acl_priority_on_connect(struct hci_de=
v *hdev, struct sk_buff *skb
>  }
>  EXPORT_SYMBOL_GPL(btbcm_set_acl_priority_on_connect);
>
> +/* The BCM4364 and BCM4377 of the T2 Macs set bits above the event type =
of LE
> + * Advertising Reports, 0x13 and 0x23 for ADV_NONCONN_IND for example. T=
he
> + * core drops reports of unknown types, so clear them.
> + */
> +void btbcm_fixup_le_adv_report(struct sk_buff *skb)
> +{
> +       struct hci_event_hdr *hdr =3D (void *)skb->data;
> +       struct hci_ev_le_advertising_info *info;
> +       u8 *p, *end;
> +       u8 num;
> +
> +       if (hci_skb_pkt_type(skb) !=3D HCI_EVENT_PKT ||
> +           skb->len < HCI_EVENT_HDR_SIZE + 2 || hdr->evt !=3D HCI_EV_LE_=
META)
> +               return;
> +
> +       p =3D skb->data + HCI_EVENT_HDR_SIZE;
> +       if (p[0] !=3D HCI_EV_LE_ADVERTISING_REPORT)
> +               return;
> +
> +       num =3D p[1];
> +       p +=3D 2;
> +       end =3D skb->data + skb->len;
> +       while (num-- && p + sizeof(*info) + 1 <=3D end) {
> +               info =3D (void *)p;
> +               info->type &=3D 0x0f;
> +               p +=3D sizeof(*info) + info->length + 1;
> +       }
> +}
> +EXPORT_SYMBOL_GPL(btbcm_fixup_le_adv_report);

I don't think I agree with this being cleaner then doing at
hci_event.though; not only is it more code but it also walks the
packet which is inefficient and may have security implications as
well.

>  int btbcm_patchram(struct hci_dev *hdev, const struct firmware *fw)
>  {
>         const struct hci_command_hdr *cmd;
> diff --git a/drivers/bluetooth/btbcm.h b/drivers/bluetooth/btbcm.h
> index a4d47b242e9..56936e64b5f 100644
> --- a/drivers/bluetooth/btbcm.h
> +++ b/drivers/bluetooth/btbcm.h
> @@ -60,6 +60,7 @@ int btbcm_write_pcm_int_params(struct hci_dev *hdev,
>                                const struct bcm_set_pcm_int_params *param=
s);
>
>  void btbcm_set_acl_priority_on_connect(struct hci_dev *hdev, struct sk_b=
uff *skb);
> +void btbcm_fixup_le_adv_report(struct sk_buff *skb);
>
>  int btbcm_setup_patchram(struct hci_dev *hdev);
>  int btbcm_setup_apple(struct hci_dev *hdev);
> @@ -101,6 +102,10 @@ static inline void btbcm_set_acl_priority_on_connect=
(struct hci_dev *hdev,
>  {
>  }
>
> +static inline void btbcm_fixup_le_adv_report(struct sk_buff *skb)
> +{
> +}
> +
>  static inline int btbcm_setup_patchram(struct hci_dev *hdev)
>  {
>         return 0;
> diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
> index cf4f1455cf9..1ae9619ee1e 100644
> --- a/drivers/bluetooth/hci_bcm.c
> +++ b/drivers/bluetooth/hci_bcm.c
> @@ -148,6 +148,7 @@ struct bcm_device {
>         bool                    no_uart_clock_set;
>         bool                    use_autobaud_mode;
>         bool                    acl_priority;
> +       bool                    adv_type_fixup;
>         u8                      pcm_int_params[5];
>         u32                     max_autobaud_speed;
>  };
> @@ -686,6 +687,9 @@ static int bcm_recv_event(struct hci_dev *hdev, struc=
t sk_buff *skb)
>         struct hci_uart *hu =3D hci_get_drvdata(hdev);
>         struct bcm_data *bcm =3D hu->priv;
>
> +       if (bcm->dev && bcm->dev->adv_type_fixup)
> +               btbcm_fixup_le_adv_report(skb);
> +
>         if (bcm->dev && bcm->dev->acl_priority)
>                 btbcm_set_acl_priority_on_connect(hdev, skb);
>
> @@ -1100,6 +1104,7 @@ static int bcm_get_resources(struct bcm_device *dev=
)
>
>         if (x86_apple_machine && !bcm_apple_get_resources(dev)) {
>                 dev->acl_priority =3D true;
> +               dev->adv_type_fixup =3D true;
>                 return 0;
>         }
>
> diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4=
377.c
> index 30fcadfae3f..8d99a7a8f76 100644
> --- a/drivers/bluetooth/hci_bcm4377.c
> +++ b/drivers/bluetooth/hci_bcm4377.c
> @@ -691,6 +691,7 @@ static void bcm4377_handle_event(struct bcm4377_data =
*bcm4377,
>
>         memcpy(skb_put(skb, len), payload, len);
>         hci_skb_pkt_type(skb) =3D type;
> +       btbcm_fixup_le_adv_report(skb);
>         btbcm_set_acl_priority_on_connect(bcm4377->hdev, skb);
>         hci_recv_frame(bcm4377->hdev, skb);
>


--=20
Luiz Augusto von Dentz

