Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FE5CD4849
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdSVwVNFWa3UDXoRV1/YfYWA8WTDmQgTkzVuCwG7akc=; b=vAkQwgGflShJqucRurAw86kCdt
	1Vt/uCmf0yIo19EBmBLR9cicbh7ZP0evHcKdfkn7EJeFXZMYmCm3nc7LrTMa/XWlJblaVnfR8icql
	bc0eR89/8fUUznsRYkPG7EWPij7HSnPOSJYzXjFc0XG9/WcF422801tR115MhwyyjC1ylXDyw79tc
	VuZ/jjHYtDBC13SSBnLrFD4viEG8Ke9G4BYq4RrRYiTGOlnMApwe4GSKR3NKQ0jOGYazLpmHHNCa1
	mZYKy2ISPq3jMKGOIUBeuUcI5KuY+aE7PIwEzaCL1dg5qfq4KXLGu4H/dWUruXeEhFk5vaiKVL1wJ
	m/WWhPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJIED-00000009WwH-10h9;
	Wed, 12 Nov 2025 21:18:09 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJIEB-00000009Wvw-0PB3;
	Wed, 12 Nov 2025 21:18:07 +0000
Message-ID: <1dd236fc-26f7-4c02-b183-c3fc13d24767@infradead.org>
Date: Wed, 12 Nov 2025 13:18:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
To: Daniel Baluta <daniel.baluta@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-imx@nxp.com
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <20251112125741.GB1319094-robh@kernel.org>
 <CAEnQRZB4ymvSERKhJW=PAk5xA2JYD=i4wzkbumj_g5S8BjONjg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAEnQRZB4ymvSERKhJW=PAk5xA2JYD=i4wzkbumj_g5S8BjONjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 11/12/25 5:35 AM, Daniel Baluta wrote:
> On Wed, Nov 12, 2025 at 2:59 PM Rob Herring <robh@kernel.org> wrote:
>>
>> On Tue, Nov 04, 2025 at 02:33:13PM -0600, Shenwei Wang wrote:
>>> Describes the gpio rpmsg transport protocol over the rpmsg bus between
>>> the cores.
>>>
>>> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>>> ---
>>>  Documentation/staging/gpio-rpmsg.rst | 202 +++++++++++++++++++++++++++
>>>  Documentation/staging/index.rst      |   1 +
>>
>> Why is this in staging when none of the drivers are?
> 
> I guess that's because remoteproc.rst and rpmsg.rst are in Documentation/staging
> and that's because when converting them from .txt to .rst the author
> didn't know a
> good place where to move them.
> 
> Would Documentation/driver-api be a good place for these doc files? I
> can move them
> and then Shenwei place the gpio-rpmsg.rst in the Documentation/driver-api also

Documentation/driver-api/gpio/ if its driver documentation.
Documentation/userspace-api/gpio/ if it user API docs
There is also gpio documentation in Documentation/admin-guide/gpio/ which could
also be appropriate depending on the nature of the document.

-- 
~Randy


