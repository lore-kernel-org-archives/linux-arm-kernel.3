Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC51C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Mime-Version:Content-Transfer-Encoding:To:From:Cc:Subject:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+93hx6XVp6hnWKYUhk6yq/sXR5a08PxGewfyuomRE2A=; b=5Coe7WZlRFbvXdyxNtOqZbTCD5
	ogPO3KTpgDi/+9V3jM43/etKjE5oktfKXaYivr3grTb4NN3gdmb1u7NBAP5dc/vlnArOf1I7+TTWh
	kAvEjKz8e4k7X6ZsOspXOX9LiYrS8rCFwaU/hSvQG4FYGFB8N54NzeQykMAq/pY/l7J1Mj0IKa0ET
	hROvpmo7vAKzuZF4GLybMVwTY3627qhbQx2f7YevM9acdzE165fdIl5GWXBQWXfIRA/eUnAl3ZpLJ
	qhxjx3D7rF9tUPVbRgGYEsrxVdYgFbkCyLPMorO1TH6Zq3JrVCQgbtzZv4G5mMPfKUd+jaq88xgfN
	8waaUekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnxY-0000000DKcK-2ZIS;
	Mon, 06 Jul 2026 18:22:24 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnxW-0000000DKab-1gtN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:22:23 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=RQuPLUX0AgnrLZJVUCxiIX2ZUpaP1ztnxfTSLd3J638vuJAV0mNnU23tAHs/oqGSuezVvg6sE7n8eAS3PPn1ARRIJylwsWEkt1nwMCWgI81iAUBp6jwf+A8idEvKwQMqkMg87gNtBmqPYm2RPs8LA+vLQHvMxQzRpRornwiCQqMRfs1rHy6/+PL93xICFOQCcFDv5jBYdP0dKSRw/vq0W9CzBCBAMua+cdhsG2jFe+aBWPeY2kypG+KIvzo3I+PNh48aBp0NqSYpDbRmGgzMY6FKxVrEppInCWsZZM1b5GxrTyb4msGJx1e2ca7zy1riYiCwLTotlIk4rQiImwmCZQ==; s=purelymail3; d=rcpassos.me; v=1; bh=+93hx6XVp6hnWKYUhk6yq/sXR5a08PxGewfyuomRE2A=; h=Received:Date:Subject:From:To;
DKIM-Signature: a=rsa-sha256; b=Kh0B5ylVuJIOUxKMm9ypUEKa6ixP4vE15z0DtWFF61NlVf8pt8FKaKDmK/s4EsIpBfN37fLPK+ZXuP32a8tEkXAl1N9nhcx0G4KTwd127+X5LnqjkTh4wOxdeqXmzvjyawp2UV0DVO9d8WXL48p0hV24kYA8C3uZglEepYCZBP5qF5Xi1RJHUzIQ3oGwLY5OIHVk66CwqvHc9WJOF4bbRAPEBqcrtucY4mR2dMvV7HQeMLl4h1fg3lKemsz99DQPN4Ms57GqvlNqefOcdcQMAWdgUH/cViQZUypnksYa9iZ98t3kWtNGZvmVn1bHh8ZRZdaJtAWaFv0fHbTuToKJSQ==; s=purelymail3; d=purelymail.com; v=1; bh=+93hx6XVp6hnWKYUhk6yq/sXR5a08PxGewfyuomRE2A=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 205051992;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 06 Jul 2026 18:21:59 +0000 (UTC)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 15:21:57 -0300
Message-Id: <DJRP3YO7Y0WK.20KNRZIMX1CYK@rcpassos.me>
Subject: Re: [PATCH v2] Bluetooth: Properly disable remote wakeup for
 MT7922/MT7925 on Ryzen platform
Cc: "Luiz Augusto von Dentz" <luiz.von.dentz@intel.com>,
 =?utf-8?b?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>,
 =?utf-8?b?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>,
 =?utf-8?b?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
From: "Rafael Passos" <rafael@rcpassos.me>
To: "Rong Zhang" <i@rong.moe>, "Rafael Passos" <rafael@rcpassos.me>, "Marcel
 Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Mailer: aerc 0.21.0
References: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe>
 <DJRKO72HWZOI.QJYJUAC45QOJ@rcpassos.me>
 <79D5F3E6-8F40-4422-BB2D-16691E377394@rong.moe>
In-Reply-To: <79D5F3E6-8F40-4422-BB2D-16691E377394@rong.moe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_112222_554763_E5476446 
X-CRM114-Status: GOOD (  10.56  )
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

On Mon Jul 6, 2026 at 12:08 PM -03, Rong Zhang wrote:
> Hi Rafael,=20
>
> =E4=BA=8E 2026=E5=B9=B47=E6=9C=886=E6=97=A5 GMT+08:00 22:53:17=EF=BC=8CRa=
fael Passos <rafael@rcpassos.me> =E5=86=99=E9=81=93=EF=BC=9A
>>Tested-by: Rafael Passos <rafael@rcpassos.me>
>
> Thanks a lot for your testing!
>
> Your issue sounds related to the remote wakeup issue I am addressing. Aft=
er triggering the remote wakeup bug, rebooting the platform without a power=
 cycle [1] always causes a failure in USB enumeration before the driver pat=
h.

In my case, just the power cycle was not sufficient. I had to also
change settings in BIOS [1], and only then it came back.
Even after reverting all settings to the same state as before.

I was hoping to fix this in Kernel, but I don't see a way forward.
If you have any other ideas or patches to test, send them my way!
I will gladly help.

[1] I turned off sr-iov, resize-bar & disabled "Bluetooth On/Off".
In a previous attempt, fast-boot and TPM were also disabled.

Thanks,
Rafael Passos

