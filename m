Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84630C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjLrWMwnOdyPXmg9OSM+mcr+ohUq3DRJbZapfAmwaH4=; b=ovOGwIRrRrn0IVvCebPzvzUD5p
	TI18aNMEXTBo+U2i01Hkg/6XgTF7TT8IG+2DVNySshntstz25OglEKIfAeHq69kF1B/BDJk2BqosI
	nZTS6y1EKy1x8bWJ7MyiVR1SqzHvOHBzCPFy2QZcMXki+C7oI0qGfvCqhBrqtbAuNNUuPOyhBGexg
	CDo48797taSs5ahstmJL1ZEXusZ94RvSngs3ELGaA4FUtbVM5WCcui+rMUU7PZbhniJHq8Z8TcT8x
	avSxX/prBto9/xxmob5QUn2onmFfvUnNAkJiMVwZDvLQ1lJQMOfsTHHo0GWEsD5DExbuilp7FZxhi
	yXHHSYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6YKd-00000002pop-2Cvo;
	Sun, 20 Apr 2025 17:19:51 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6YIi-00000002pcL-3caq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 17:17:54 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1745169469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UjLrWMwnOdyPXmg9OSM+mcr+ohUq3DRJbZapfAmwaH4=;
	b=M+CCltMeK35q8jJfYJNdDJQGnKCKXyIAIolLIH9oDy1hUycv6F4cZawK/npxGQnTElWtN0
	EqgKJh7NZ93Gt18DxlBrz2bdB/z1BWbf1qIwfzVHSi2YeRNMlB/S3RTxRiRKwMs91IT00y
	wNpTzs2Nb7QYmKO6g/7MK4acaHWkxMgzfjKdcbdmFEdDABoSU7M0eYnQjyzO5BdpdUoAe0
	ZmfC07DNfGl9chvZUPIU0fJH9FoqFnoVVMli70WbVsaIiTcvx3Kg9MS8zHkmsy72Y3bH6t
	+T9vrH+GOqonO9y/ei1E4ymdKgZmz/n1rO1cZC1TC29Zul+GwbWz0FW1/LQT6w==
Date: Sun, 20 Apr 2025 19:17:48 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on
 SoPine
In-Reply-To: <CALeDE9Nyt7Di2_u-Vf=6OCAg-6wmbz75Cs_MCfZrk6upbD9nZw@mail.gmail.com>
References: <20250419160051.677485-1-pbrobinson@gmail.com>
 <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org>
 <CALeDE9Nyt7Di2_u-Vf=6OCAg-6wmbz75Cs_MCfZrk6upbD9nZw@mail.gmail.com>
Message-ID: <e111f8b9f499a158af5fad1942951e0f@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_101753_258356_B33F0232 
X-CRM114-Status: GOOD (  11.70  )
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

Hello Peter,

On 2025-04-20 11:33, Peter Robinson wrote:
>> > This adds all the pin mappings on the WiFi/BT header on
>> > the SoPine baseboard/A64-LTS. They're disabled by default
>> > as the modules don't ship by default. This includes, where
>> > they haven't been already, UART1 for BT and mmc1 for WiFi.
>> 
>> The patch subject should be improved a bit, to include
>> "Baseboard" as well.  Having just "SoPine" is a bit too
>> vague, and it should actually be written as "SOPINE"
>> at all places in the prose.
> 
> It literally has baseboard in the second line of the description.

True, but the patch subject should also contain "Baseboard",
because SOPINE is a system on module, and the SOPINE Baseboard
turns it into an SBC that actually has the add-on headers that
the patch addresses.  I hope it makes sense.

