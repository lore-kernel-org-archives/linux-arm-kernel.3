Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4332ACA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4dSGioxFo4M4rdf3JnJE8WIclENgwBnsbRifgmAlrU=; b=YiXK9yITpHrG66T4us7kPOtYGn
	rrR+UwvaPjxOP8HhUJ23QQNUNN1hvTSfFEkr7qpbTdvZQp27clBlOYJis1ZmaOYW5no5Z+7Se/Scq
	UE3g90orbTYflMJMK2/Puls81ll1vTGSqA/2uMdBOg8np06itqwxhcwhlzYxYctfeckMA1X+I7a0H
	wPVysqZyAwcVh8TOdoZGYhn50a+QoG16m+Mj6CufL+pxJbjRlWyUpyMQq2k9OmlwKHiyFRzwjpxc/
	thPj91oORuF+JE2xFFcEzDEGA5+pTeNJTwBOwvkY+WtNl/+opE2knpbG0GABEG4qgXuMy4NkAz9R0
	/VuAoQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZay-00000003X1E-1NXX;
	Fri, 22 Aug 2025 21:46:48 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNeL-000000020FB-05Ni
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=N4dSGioxFo4M4rdf3JnJE8WIclENgwBnsbRifgmAlrU=;
	b=FLzuYBjAM80wv95phdoRt2N8B7AsAOOGMEetr6qoM249MlSG09cL7yT0nQ227p
	/BKCbxL+P/YHOWOh01wxEzA5lExpIPKDxXp9OiRoKgF/MStlBRchyCW534uESgXn
	ptR5AsYflE4lqaz0eHzOYZRdhvI5Fc+sQ01MQ0RJiSwy8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXRdvcMahoDisoAw--.17475S3;
	Fri, 22 Aug 2025 17:01:18 +0800 (CST)
Date: Fri, 22 Aug 2025 17:01:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix missing microSD slot vqmmc on
 Data Modul i.MX8M Plus eDM SBC
Message-ID: <aKgx3DOjkQYYGFAc@dragon>
References: <20250810160500.10213-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810160500.10213-1-marek.vasut@mailbox.org>
X-CM-TRANSID: Ms8vCgDXRdvcMahoDisoAw--.17475S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUemhFUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNh7HLWioMd6MNwAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_020129_362125_ADBE1A57 
X-CRM114-Status: UNSURE (   7.96  )
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

On Sun, Aug 10, 2025 at 06:04:32PM +0200, Marek Vasut wrote:
> Add missing microSD slot vqmmc-supply property, otherwise the kernel
> might shut down LDO5 regulator and that would power off the microSD
> card slot, possibly while it is in use. Add the property to make sure
> the kernel is aware of the LDO5 regulator which supplies the microSD
> slot and keeps the LDO5 enabled.
> 
> Fixes: 562d222f23f0 ("arm64: dts: imx8mp: Add support for Data Modul i.MX8M Plus eDM SBC")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied, thanks!


