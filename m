Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3416B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yS3v/Nej;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FjNcOokx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References
	:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s/1HC7HLgdcjFFQ/QDDoo7NoiUF0jCrqwATSiKldbZI=; b=yS3v/Nejfvk93/
	9803j003GkwQU16fOtMjitE9khA9Gri9ANOTz6wrvvg1FWva2cWW5J0JoJXrYKWhhMTR1f9MTHEvI
	fFyRBe7jOgkd0YveiWKvJq9TFfhULoC14o9M+dHQb7K/uvRchfQNGvYvootF4WMwhEHi69BErRN6B
	X8110oXVS5+YpOIMpcH0VFmtQG3b2y6ox49ea9K+bE8pQsFJypu5Pgro+7ARblsvAHvgW3Vek9xO6
	cfwjsTL3vHS9Y+JxE/Z2iUz2b0URzm0EEKklNZDa41pgUB3U4c5CiNz4dxt4RD0B0/c+N1Nxy1JLJ
	pZLMlX8cqTXNnodqQTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOd0Y-00000005nwG-0BSp;
	Wed, 04 Nov 2026 15:34:38 +0000
Received: from out-139.mta1.migadu.com ([95.215.58.139] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOd0V-00000005nuy-2BGU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:34:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Qs5GGmuuHSWXZnhWmFdpplNiNpolTejJoLIyv+Fwxp0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793806472; v=1; x=1794411272;
 b=FjNcOokxF3sgw++Ejcm0aS3LGH6TjUzz3M8fJB4OYfZBRycOlnquC2JKluUTNa5mXQ4s3U/U
 nuLGRvv8niMx1RqjmBgU9XeKFeGx/1rrwBjb7z1ZuhvGyVfQ/jdrNo4OtIDQrxGikKQa1qwKVoi
 HoPI0VcqPpsi6VWxAO0Jj3ac=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 17b85c0625fddc68;
	Wed, 04 Nov 2026 15:34:32 +0000
X-Mizu-Trace-ID: 17b85c0625fddc68
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Aditya Garg <aditya.garg@linux.dev>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE advertising report types
Date: Wed, 4 Nov 2026 21:04:16 +0530
Message-Id: <F6EC6963-A4F5-4109-BD87-E4FE0A80C6C8@linux.dev>
References: <CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com>
Cc: Andre Eikmeyer <dev@deq.rocks>, marcel@holtmann.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 sven@kernel.org, j@jannau.net, neal@gompa.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 66ton99@gmail.com,
 josemiguelo.ochoa@gmail.com, Yossef Osman <Yossef.Osman@proton.me>
In-Reply-To: <CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: iPad Mail (24B119)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_073435_704826_0F69D4E7 
X-CRM114-Status: GOOD (  20.43  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> On 4 Nov 2026, at 8:55=E2=80=AFPM, Luiz Augusto von Dentz <luiz.dentz@gmai=
l.com> wrote:
>=20
> =EF=BB=BFHi Andre,
>=20
>> On Wed, Nov 4, 2026 at 10:16=E2=80=AFAM Andre Eikmeyer <dev@deq.rocks> wr=
ote:
>>=20
>> The BCM4364B0 of the MacBookPro15,1 (UART) and the BCM4377 of the
>> MacBookAir9,1 (PCIe) set bits 4, 5 and 7 of the event type in LE
>> Advertising Report events. btmon on the 15,1 shows types 0x10, 0x13,
>> 0x14, 0x20, 0x23, 0x24, 0x93 and 0xa0 next to plain 0x00, 0x03 and 0x04,
>> the same advertiser shows up as 0x13, 0x23 and 0x03. The kernel log of
>> the 9,1 lists 0x10 to 0x24 and 0x80, 0x83, 0x90, 0x93, 0xa0, 0xa3.
>> process_adv_report() drops every type above 0x04 with "Unknown
>> advertising packet type", so most advertisements never reach the host.
>> An AirDrop sender was reported as 0x23, 0x23 and 0x13 and only the
>> fourth report, 0x03, reached BlueZ 32 s after the first one.
>>=20
>> Add btbcm_fixup_le_adv_report(), which clears the bits above the type,
>> and call it from hci_bcm on Apple machines and from hci_bcm4377 before
>> the event goes to the core.
>>=20
>> Suggested-by: Jose Miguel Ochoa <josemiguelo.ochoa@gmail.com>
>> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
>> Tested-by: Aditya Garg <aditya.garg@linux.dev>
>> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
>> ---
>> drivers/bluetooth/btbcm.c       | 30 ++++++++++++++++++++++++++++++
>> drivers/bluetooth/btbcm.h       |  5 +++++
>> drivers/bluetooth/hci_bcm.c     |  5 +++++
>> drivers/bluetooth/hci_bcm4377.c |  1 +
>> 4 files changed, 41 insertions(+)
>>=20
>> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
>> index 0facfe62333..527a5c75fd6 100644
>> --- a/drivers/bluetooth/btbcm.c
>> +++ b/drivers/bluetooth/btbcm.c
>> @@ -282,6 +282,36 @@ void btbcm_set_acl_priority_on_connect(struct hci_de=
v *hdev, struct sk_buff *skb
>> }
>> EXPORT_SYMBOL_GPL(btbcm_set_acl_priority_on_connect);
>>=20
>> +/* The BCM4364 and BCM4377 of the T2 Macs set bits above the event type o=
f LE
>> + * Advertising Reports, 0x13 and 0x23 for ADV_NONCONN_IND for example. T=
he
>> + * core drops reports of unknown types, so clear them.
>> + */
>> +void btbcm_fixup_le_adv_report(struct sk_buff *skb)
>> +{
>> +       struct hci_event_hdr *hdr =3D (void *)skb->data;
>> +       struct hci_ev_le_advertising_info *info;
>> +       u8 *p, *end;
>> +       u8 num;
>> +
>> +       if (hci_skb_pkt_type(skb) !=3D HCI_EVENT_PKT ||
>> +           skb->len < HCI_EVENT_HDR_SIZE + 2 || hdr->evt !=3D HCI_EV_LE_=
META)
>> +               return;
>> +
>> +       p =3D skb->data + HCI_EVENT_HDR_SIZE;
>> +       if (p[0] !=3D HCI_EV_LE_ADVERTISING_REPORT)
>> +               return;
>> +
>> +       num =3D p[1];
>> +       p +=3D 2;
>> +       end =3D skb->data + skb->len;
>> +       while (num-- && p + sizeof(*info) + 1 <=3D end) {
>> +               info =3D (void *)p;
>> +               info->type &=3D 0x0f;
>> +               p +=3D sizeof(*info) + info->length + 1;
>> +       }
>> +}
>> +EXPORT_SYMBOL_GPL(btbcm_fixup_le_adv_report);
>=20
> I don't think I agree with this being cleaner then doing at
> hci_event.though; not only is it more code but it also walks the
> packet which is inefficient and may have security implications as
> well.

The hci_event patch makes it apply for all Broadcom chips. The author who se=
nt that patch themselves use a T2 Mac. I doubt all Broadcom chips need this b=
ecause there have been no bug reports from normal PCs.=

