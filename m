Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C8AF01821
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMeqslybOW2+duB8kifg1EmjsYpVV4hNMJZj7+LPARk=; b=oJJIwsA7QRf1kZ3nKuBkGFp8A3
	jqzTFJtvxHL1FLNi3vmUKJipUELvaFyyjngWoDOo/67AeE/+0faylnb83rcI7aOnxStKwANquu9mV
	CDmTca8O2+x/hd52xFS2hLMkxAKbmoq9SC9GJ/kE2f8CMJQLPnoh13G6tSHfdyBsAhBz6t5UDJa3a
	g9FSQRACC+t/k1daS2PA30VYwDsaelFJt1VQSxmgU2lOCtbtyhT1V+awSwwh6x4Vjc4Y/pvqa4DCp
	0WeoNUM5LhYS+3o+a0BzOraivOEdT/coXKdElA1wgbsAGLQyoGaSEyrv3x3UisaRVTXyJzdyM90oc
	0I9Lzwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySa6-00000003UMC-0Leh;
	Fri, 06 Mar 2026 10:38:54 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySa2-00000003UKk-2lrl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:Subject:To:
	From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PMeqslybOW2+duB8kifg1EmjsYpVV4hNMJZj7+LPARk=; b=nhT7pXqIwmwxJXg0QLonxKGqUU
	npmPA235Is2wPVPlOIdqFKf5XSWqb5alein90piHyDWJ+Ec1PBLg/ATbUdB8khnPd+dCZtd1vhxir
	SLoLo0bhqWgpwEpMEY5xKqvhhZ8k5aSrRIDSgLJkj1gSInYoUU7EL6ZQWFGW8w3cfx+JArOkoVqwp
	K8Loniurp8W1MPhoe0A7hI/6qzJEV0WqIDuOCwfHu7ksEjI8try4cSXTqrIVN+d5JNLgu+8pvVaK0
	cFxwRxaJ7/dclXct7HlHh2vSAzOdkisBPRzWXS6yiWi08RoI2CYk8c9+FRY+uxRnsE4KGguqpKCEW
	Ak9m6kkw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vySZc-000PyD-18;
	Fri, 06 Mar 2026 11:38:24 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vySZb-000NTP-22;
	Fri, 06 Mar 2026 11:38:23 +0100
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 10:38:19 +0000
Message-Id: <DGVMUIOJEVMP.175UQQKV32PR4@folker-schwesinger.de>
Cc: "Rahul Navale" <rahul.navale@ifm.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
 <suraj.gupta2@amd.com>, <thomas.gessler@brueckmann-gmbh.de>,
 <radhey.shyam.pandey@amd.com>, <tomi.valkeinen@ideasonboard.com>,
 <marex@nabladev.com>, <marex@denx.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
X-Mailer: aerc 0.21.0-119-g0a449d4a7ff3
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260305112705.6862-1-rahulnavale04@gmail.com>
In-Reply-To: <20260305112705.6862-1-rahulnavale04@gmail.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27932/Fri Mar  6 08:24:27 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_023851_036007_F6316F35 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

On Thu Mar 5, 2026 at 12:27 PM CET, Rahul Navale wrote:
> From: Rahul Navale <rahul.navale@ifm.com>
>
>>Could you confirm that the DMA IP core in your PL design operates in=20
>>scatter Gather mode?
>
> Yes, We confirmed that our DMA IP core in the PL design are configured=20
> for Scatter-Gather mode.

Thanks for confirming, this disproves the last theory. Please undo the
latest Xilinx DMA patch I sent.
To get some more data, could you apply the following patch (keep RFC
patch and debug stuff) and rerun with 7e01511443c3 a) applied and b)
reverted and post logs for both cases:

dmesg|grep ptr_res

<--8<-->
diff --git i/sound/soc/soc-generic-dmaengine-pcm.c w/sound/soc/soc-generic-=
dmaengine-pcm.c
index a63e942fdc0b..4635b199d020 100644
--- i/sound/soc/soc-generic-dmaengine-pcm.c
+++ w/sound/soc/soc-generic-dmaengine-pcm.c
@@ -280,11 +280,16 @@ static snd_pcm_uframes_t dmaengine_pcm_pointer(
 	struct snd_pcm_substream *substream)
 {
 	struct dmaengine_pcm *pcm =3D soc_component_to_pcm(component);
+	snd_pcm_uframes_t ptr =3D 0;

-	if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
-		return snd_dmaengine_pcm_pointer_no_residue(substream);
-	else
-		return snd_dmaengine_pcm_pointer(substream);
+	if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE) {
+		ptr =3D snd_dmaengine_pcm_pointer_no_residue(substream);
+		printk("ptr_res_no: ptr =3D 0x%08lx\n", ptr);
+	} else {
+		ptr =3D snd_dmaengine_pcm_pointer(substream);
+		printk("ptr_res: ptr =3D 0x%08lx\n", ptr);
+	}
+	return ptr;
 }

 static int dmaengine_copy(struct snd_soc_component *component,
<-->8-->


