Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297A4CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 13:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeLnFp9m+pf5y3QIUl8+WeK1RXHgtgz8teGgBVub6X0=; b=u0lANTeuP4D22Zv/PzyUJmeNxT
	qP874r95Eh7gqu967w1mtGqBvQZXYV080Y5LGpdsY0mvoBF/8hHfBVrIYFXyU0vwVIzw58qLxSn1G
	uDtOIAwPo+iFeizD6oDJeaVIHEpzsP8XBc4PHibNqxZu3KqHykYbiIy7/X3HmM2+7ujrfRO+03bge
	dv2/Wm9k4IvaSy3QKWGSkyoJY9mSCi/5uVuCUeeLLG7/jBRwau8k1pF48v5rUSjAHvFV4f37Uzae2
	cddAd0igo+J41xg0RLlhjDcAUqdil8bA/unuCXmb8pSmFoppgGkt7KHH4eoa1DYG4OjJ+I9ud0tfg
	PSi4sxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVox-0000000HMcv-0Yzb;
	Mon, 25 May 2026 13:58:19 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVou-0000000HMbf-1DDr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 13:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1779717494;
 bh=ZeLnFp9m+pf5y3QIUl8+WeK1RXHgtgz8teGgBVub6X0=;
 b=kWTbUTVIB6zMMzktJsNKSk7lh6s7ZecOg76KdnD/RlOtDkKPTekOV9n2foiY3/49RDnfaiaiq
 gGPSj0BIgXn5NgAB7dmXcyE8oXiwJbl3cv5JCbD3oZ1KBu8Y5Yl2/NAhugzYDtasSt5xWx2Wv4h
 iST1del3yfl2HPzoW5pgqdIz81xQpy7BAM5hJ+JSap6iWPtHDF9VdWVNiVbJZXA/BkZ69fXflEa
 Fz1HyvaANtMp55zNZxSkDpu0J34QJFZxoXkvJ82OoJtnONUUJhknrxFpBGCG6hJZvAjtKGssoz/
 DkigEdGnmbi/mZYlRpmEt+KbZs6XUaH5/K/g3F1BsWeg==
X-Forward-Email-ID: 6a1455716744e73b78d0d539
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.15
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 25 May 2026 09:58:06 -0400
Message-Id: <DIRT7260SRQZ.1BFF8CX3FJ57G@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sasha Finkelstein" <k@chaosmail.tech>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Marcel
 Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-bluetooth@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH v3] Bluetooth: Add Broadcom channel priority commands
X-Mailer: aerc 0.21.0
References: <20260525-brcm-prio-v3-1-6259e10233f8@chaosmail.tech>
In-Reply-To: <20260525-brcm-prio-v3-1-6259e10233f8@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_065816_687174_4F42DAB1 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon May 25, 2026 at 8:11 AM EDT, Sasha Finkelstein wrote:
> --- /dev/null
> +++ b/net/bluetooth/brcm.c
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 The Asahi Linux Contributors
> + */
> +
> +#include <net/bluetooth/bluetooth.h>
> +#include <net/bluetooth/hci_core.h>
> +
> +#include "brcm.h"
> +
> +struct brcm_prio_cmd {
> +	__le16 handle;
> +	u8 enable;
> +} __packed;
> +
> +int brcm_set_high_priority(struct hci_dev *hdev, struct hci_conn *conn,
> +			   bool enable)
> +{
> +	struct sk_buff *skb;
> +	struct brcm_prio_cmd cmd;
> +
> +	if (!hdev->brcm_capable)
> +		return 0;
> +
> +	if (conn->brcm_high_prio =3D=3D enable)
> +		return 0;
> +
> +	cmd.handle =3D cpu_to_le16(conn->handle);
> +	cmd.enable =3D !!enable;
> +

Probably a dumb question, but worth asking - what is the purpose of the
"!!"? Wouldn't just passing "enable" be sufficient?

Also, currently, cmd.enable seems to just be set and used in the case
of boolean conditions. Would it make sense for the enable field in
brcm_prio_cmd to be a bool or does it not really matter?

> +	skb =3D hci_cmd_sync(hdev, 0xfc57, sizeof(cmd), &cmd, HCI_CMD_TIMEOUT);
> +	if (IS_ERR(skb))
> +		return PTR_ERR(skb);
> +
> +	conn->brcm_high_prio =3D enable;
> +	kfree_skb(skb);
> +	return 0;
> +}
> diff --git a/net/bluetooth/brcm.h b/net/bluetooth/brcm.h
> new file mode 100644
> index 000000000000..2290fc6cf798
> --- /dev/null
> +++ b/net/bluetooth/brcm.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 The Asahi Linux Contributors
> + */
> +
> +#if IS_ENABLED(CONFIG_BT_BRCMEXT)
> +
> +int brcm_set_high_priority(struct hci_dev *hdev, struct hci_conn *conn,
> +			   bool enable);
> +
> +#else
> +
> +static inline int brcm_set_high_priority(struct hci_dev *hdev,
> +					 struct hci_conn *conn, bool enable)
> +{
> +	return 0;
> +}
> +
> +#endif
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index c46c1236ebfa..0e74bad496a2 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -46,6 +46,7 @@
>  #include "msft.h"
>  #include "aosp.h"
>  #include "hci_codec.h"
> +#include "brcm.h"
> =20
>  static void hci_rx_work(struct work_struct *work);
>  static void hci_cmd_work(struct work_struct *work);
> @@ -3696,6 +3697,9 @@ static void hci_sched_acl_pkt(struct hci_dev *hdev)
> =20
>  			skb =3D skb_dequeue(&chan->data_q);
> =20
> +			if (skb->priority =3D=3D TC_PRIO_INTERACTIVE)
> +				brcm_set_high_priority(hdev, chan->conn, true);
> +
>  			hci_conn_enter_active_mode(chan->conn,
>  						   bt_cb(skb)->force_active);
> =20
>
> ---
> base-commit: 8bc67e4db64aa72732c474b44ea8622062c903f0
> change-id: 20260407-brcm-prio-b630e6cc3834
>
> Best regards,
> -- =20
> Sasha Finkelstein <k@chaosmail.tech>


