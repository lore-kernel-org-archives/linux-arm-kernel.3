Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A63ACA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkU1RGbl9BVgABIuUMMvRh0yoQdtBqyMhXOop0bDDvs=; b=wAc5e+6J/KsCytZOM5ac/SgMlM
	01Uru9WPmMycOSrTzh1LAGdezqGxnDYdjW01x9VWFidSApdA+deO7rsl6GdrjX7EPbHHw+AhFeGHj
	0yDKeOfVdW1rovUE7zK6cU8InjctyoCa50IA0YoRj1fHVLdwG1CydwtfqdbBL/nXpvP87epwjq9H+
	Kp3dqyz+CQszFSE4BYepI3omO9Vz9g9eF7fxzFF8uFO+NEeAy3m+DwZ4JA0xhrplwh5ak09zyScb1
	fKXiZhkHMg6WTSOGiQcD0v0+NxPZsDhPNRQBvd2Edym+Wrjf0mA2r2Qq4YwfA+LYOXt4NnZqhPH8o
	6EOOEuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9i7-000000076LP-0Lb0;
	Sat, 30 Aug 2025 00:44:51 +0000
Received: from smx-a.mailgw.jp ([210.171.6.215] helo=rmx-a.mailgw.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxmE-00000005ZOx-3DNg;
	Fri, 29 Aug 2025 12:00:20 +0000
Received: from bccml.bai.ne.jp (bccml-a.bai.ne.jp [210.171.3.161])
	by rmx-a.mailgw.jp  with ESMTP id 57TBxvln023337-57TBxvlo023337;
	Fri, 29 Aug 2025 20:59:57 +0900
Received: from [192.168.11.5] (bai859bcd79.bai.ne.jp [133.155.205.121])
	by bccml.bai.ne.jp (Postfix) with ESMTPA id 4964881773;
	Fri, 29 Aug 2025 20:59:57 +0900 (JST)
Message-ID: <0b061e42-0a01-4839-871c-a5d760dbddeb@bcc.bai.ne.jp>
Date: Fri, 29 Aug 2025 20:59:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enables sound output from the
 audio jack on OrangePI5 Plus
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, robh@kernel.org
References: <20250826134456.9636-2-opi5plus@bcc.bai.ne.jp>
 <AM7P189MB1009A67370CA029038DF2A69E33BA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Hide Hako <opi5plus@bcc.bai.ne.jp>
In-Reply-To: <AM7P189MB1009A67370CA029038DF2A69E33BA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-FE-Last-Public-Client-IP: 210.171.3.161
X-FE-Policy-ID: 3:1:2:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=bcc.bai.ne.jp; s=20240516; c=relaxed/relaxed;
 h=message-id:date:mime-version:subject:to:cc:references:from:content-type;
 bh=qkU1RGbl9BVgABIuUMMvRh0yoQdtBqyMhXOop0bDDvs=;
 b=Cv9hQKSQCoZXlO1FE5xL0R85p8woA96QjvXwvKYl5Yc+czjzgJS0+oTG1I1nUUDd0m2JRdQhBLI9
	g1BbClQhUZnjXIVsZ2kCQX99UrNk8AREPpCRCGtQ35C3zb3LxYwh9gk8smjmwRzEn1WASS68EkPO
	H+1ldF5wz4Yi/xklxpPCmUo6AY/avLbM0Ms0qLPJQ4Gc1o1rhzU2CiR6jnMA+hJajJFC7ZS2UsiR
	iLTqohar4uvZOcbW7uHBzghECQY+LHvzq1Fy0thTV3SplTbShWT0OMdWs7QPKn4j4bLAkOl1DeMs
	PPiga5mOWTA1GaWIlA6x5oWHuUcHSm2w+AyMEg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_050019_372532_C9AD18E9 
X-CRM114-Status: UNSURE (   7.04  )
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

Hello Maud,

On 2025/08/28 17:47, Maud Spierings wrote:
> I recommend rebasing on the latest next since my fix [1] was applied.
> I also recommend testing it with that patch, for me that fixed the 
> headphone detection and enabled audio playback. The microphone is not 
> working yet though.
>
> Link: 
> https://lore.kernel.org/all/20250823-orangepi5-v1-1-ae77dd0e06d7@hotmail.com/ 
> [1]
>
Today, i build linux-next.
But sound not come out from headphone.

If you test the 6.17 kernel after using the 6.16 kernel, sound will be 
output. Try building and testing in an environment with only the 6.17 
kernel.

Or is it okay to use the JMB582 "M.2" nvme-sata 3.0 expansion card to 
connect a 2.5-inch SSD?
This makes disk swapping easy and convenient.

Hide



