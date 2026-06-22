Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2937ECDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 13:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V10NUk/gmPuBAXU0YzRkHmie0gZ9BDAPSeyjEgvzMHg=; b=2N6yy/1ydfQM5mv710yTN+wkoQ
	GYW80LBsQP50dIPQQ3EuEwW6EWyoyQ0biAYr6/gA0dQLloUBdk8IKTuEV/cJDok+ZL/cgVxjBLss5
	O3JiTo46RYEUEFueCUas35EopQjH7KC8wyIuGUET2pl6t8CIxGEo57XzhlRaqgetKSzLcoOgq+I0J
	37uQqTwx+yHF6p2f2ytPVBeqBdP5g4gtkAU4VD/Ix7c5iy+fGvBKcRqP4epeLRzVP7xty4tYlQLVx
	8gCORFW12YGy20Zo+HoW3msZxV0QRyYa6w2LROSJo6Z8n8ibYeBNI8AulIhfQUYjRDWm+dk7LWxVb
	l4Ah9n9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbf8U-000000052Uu-2XZS;
	Mon, 22 Jun 2026 13:56:26 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbf8R-000000052U6-1Zbm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 13:56:24 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gkV9G3Dn8z9tsN;
	Mon, 22 Jun 2026 15:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782136578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V10NUk/gmPuBAXU0YzRkHmie0gZ9BDAPSeyjEgvzMHg=;
	b=xcccWhVRSqDJHc/6NDRssnzaOOnGncLgvpUTUmdX2/FF2bKqUFl5lyKlsqIoZOeBYGlh5o
	OVwPiUc/yIjaMqkESFLCFicMXXxgb0S8PmqfchDuCkp9UJS8I33pmRnTqGVNe93MfeFp4W
	maVbfu0iR049vBzocLiZcujqbZ7XXoZ3Vu8LW0FbGfPODawn2FgAyIYMJ0iXnOm+AAB5GR
	aRickCq0EjdcikS9ABqqfDm1xVBn8Tspn6/SUiryd9LxztdC0PJDohwXd3VspxDwEBM4XV
	xalM/P3L6KNuvy9HPQh3cEeSiljnhM38QSVfBf7x5knmYsoJwDiAbu67VIUvSw==
Message-ID: <8cb1c3cb-3d8f-4e76-99e9-ad78ee149556@mailbox.org>
Date: Mon, 22 Jun 2026 15:04:45 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc
 node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: dacb6e1149af34e4ecb
X-MBO-RS-META: t553dx187nxeb4i3g8oa88rprwqknbpr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_065623_568068_6602EE27 
X-CRM114-Status: GOOD (  10.45  )
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

On 6/22/26 12:35 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Sun, 21 Jun 2026 at 04:51, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
>> which already has that soc: label. The soc: label is useful in U-Boot
>> where it is used in U-Boot extras DT fragments.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> For the whole series:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.3, squashed into a single
> commit. Unfortunately there is no cover letter, so I will have to add
> all nine Link-tags.

Is that why cover letter helps you ?

If so, I will start generating ones ?

Thank you for your help !

-- 
Best regards,
Marek Vasut

