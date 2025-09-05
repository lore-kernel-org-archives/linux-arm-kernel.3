Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799E7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTsO6mHmSDWEul6mnh764nhyZdJRTGDuIEcsdYTIvD4=; b=3w38GKWPNFwzfOMzgVqNeQutAn
	BfMsnGj7RFCAl2mpTTR5hLk6ZTn6OC+hdBkQCo/Kf80VKLvI+nGMLikH9tGsxK+MvzlMhWBoTd8sE
	nZq4kKXIBY4Axdg6FK3Ta31f/NOxIB9Iw1fESw4gnG4lZEPIY5VsuiMn+dJ+cP3WJ28o+VdNroSs4
	zAIy563xCfM/2rpyBCNyKEhvz+jGVHyxLY5/8d1lie5eeog8MZuOhDkQT/GMcuDPfSVZpix/6bUkp
	acaZ7c/n8AFTgemv+TyIPtXlytIIVqCmm2s95RjI1jRQVUHmR8utL9zjoUgPWDtKSDdMqos2558MM
	jsrBE+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZBt-000000034Dd-0f8I;
	Fri, 05 Sep 2025 16:21:34 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVa0-00000001hj2-0sIv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 12:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PTsO
	6mHmSDWEul6mnh764nhyZdJRTGDuIEcsdYTIvD4=; b=FITpli11m6qi37TNv+pY
	izqc0WnQsSaXmNVnXvwD1/HuGX9a2Ozv7Bnqutm0O38s/PRMlT+h3IwL9XM4vDrV
	2Yq3TXZLghUSlBfJXtPaQZ5Js5nZHTeBkVcBN8aX5JbA7eGqW6gjT6jGQGn7Ym3B
	VvLkITNAOhbqwkw/gSmqWpZB5zc3mzqaz5NEIuBh+8eCXnq3BZrK79dK3akGAFi7
	VKv0GvmQFpK7wcmE8NqU8YdARQUTJGEbe7VJ5vZaRjL5RJH03MdsWk3kIYJ2Gro3
	6GfgHq+l1Ni6NTsmLvdeLNRuaeLahWzFLjR91vke/Fzuk5WalmgBu8+rAmAaT6Ka
	6A==
Received: (qmail 4044840 invoked from network); 5 Sep 2025 14:30:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Sep 2025 14:30:07 +0200
X-UD-Smtp-Session: l3s3148p1@44x7/ww+MMogAwDPXxPDAOCjMSL5jkIv
Date: Fri, 5 Sep 2025 14:30:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT
 DTO to Retronix R-Car V4H Sparrow Hawk
Message-ID: <aLrXzl38OUhTJgxP@shikoro>
References: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_053013_137032_0BC185BB 
X-CRM114-Status: UNSURE (   9.30  )
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

Hi Marek,

On Fri, Sep 05, 2025 at 04:00:57AM +0200, Marek Vasut wrote:
> Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
> Sparrow Hawk board. Fan RPM control and full RPM on reboot has
> been tested.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Basically works for me as well, so:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> + * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
> + * /sys/class/hwmon/hwmon0/name:sensor1_thermal
> + * /sys/class/hwmon/hwmon1/name:sensor2_thermal
> + * /sys/class/hwmon/hwmon2/name:sensor3_thermal
> + * /sys/class/hwmon/hwmon3/name:sensor4_thermal
> + * /sys/class/hwmon/hwmon4/name:pwmfan
> + *                       ^      ^^^^^^

For me, the output looks different, though:

/sys/class/hwmon/hwmon0/name:pwmfan
/sys/class/hwmon/hwmon1/name:sensor1_thermal
/sys/class/hwmon/hwmon2/name:sensor2_thermal
/sys/class/hwmon/hwmon3/name:sensor3_thermal
/sys/class/hwmon/hwmon4/name:sensor4_thermal
/sys/class/hwmon/hwmon5/name:pwmfan

hwmon0 is the Argon, hwmon5 the (unpopulated) on board connector.

I hope the naming is stable, but in any case, the docs need to be
reworked a little, I guess?

Thanks for your work!

   Wolfram


