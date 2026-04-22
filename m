Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D70F94CD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrZFxBlM4jDTKYqBEEmVlzWwDmWAd7KaZsOwy3PL05I=; b=QsdJZcx9znykS5g32+4Rx2vkPu
	Vws4upPAP11/0BONTNWpn47mrnzZpPhD6NnekzxrHwZw10fo3J2putLqO6iRFMYp8gRe5w5ygbk88
	wNfL8QFRznRwNNKENnToaYeavvhcQBo7QbBI6RhYFErNjDLL2+MbNSVcw2eavFsz46rm2l0Tu3Dcw
	cRtxWRXRjHhZBVW0oVHGWcyggaRSeeOILeZe2y1wvm/pA1R6EExYrms/pasnCWykGUpxvkYLGA/Al
	sI3cTVfgOl5a1JASy2rCDFxFS+R6jBJn9esKdOFQFCNCeUh0ihpUXeTsdJfsubSR51U7rvPpfHbD4
	77CC7buQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRjf-00000009hyr-3j01;
	Wed, 22 Apr 2026 07:10:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRjc-00000009hyW-1hem
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 07:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D636360018;
	Wed, 22 Apr 2026 07:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D47C19425;
	Wed, 22 Apr 2026 07:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776841855;
	bh=MrZFxBlM4jDTKYqBEEmVlzWwDmWAd7KaZsOwy3PL05I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQQ5RD7rkIvYR8OOKyndX9mqAJyFVVurIW0JQ41g4aTfbFLEBRb5ncTG5tXtrVtpU
	 vk1542hR9izrgz2qOJvRx+H5VGDfGMe0R8/zkyA4BtTLuccRPIlysv7JMKET+WBcGE
	 AqARNs4vhK61fnol+c+/290QRIvtX9GiMQJKyjytb6E2vDdMRgQbWgDD58SkEw2TO0
	 Wsrvuu4NLEpOFdrac7Su9LE625xVa1H6d1sExHdU2H9DrYt9H/3VN171xh5xUigpf/
	 4CP//Qmkg/C4UIycgPljLDkpxGWvHG1J73BFvXQMxnS7to11mIrifcufnDjPFczqQL
	 fw10zO26hFi7A==
Date: Wed, 22 Apr 2026 09:10:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, soc@lists.linux.dev, 
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 7/8] ARM: dts: Declare UARTs on zx297520v3 boards
Message-ID: <20260422-vigorous-beautiful-peacock-4ac41b@quoll>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-7-ace038e63515@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260421-send-v5-7-ace038e63515@gmail.com>
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

On Tue, Apr 21, 2026 at 11:23:15PM +0300, Stefan D=C3=B6singer wrote:
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---
>=20

Same comments about subject and squashing. This cannot be a separate
commit.

Best regards,
Krzysztof


