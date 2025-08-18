Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB37CCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dH2eYJg9ig+kSfW7cMBeMZJ9AnsCB9cbHi+mUKQa9Z0=; b=sbrFGERNpNQ1ylvSVWx9wfZnzW
	f8cXVrU0IlV0DC4w6i0AZqJHYz05cqdvYL2lnbnV0fdnbLang1BOUa0tp5ZcVDVvoJJ82f2N9hKLa
	t2bOyB8SkqWYe/+MiCR4id9aJF/3EidmDboz0qaiwfLGoQKOgwSXQWtcu60PjorJd7dc6AH4iQW3H
	kfWJx6BzzoJ5UsePTAbxy4tuGIZfldzuQoMMKiCBUuKB+TZFHM0Y2Veh9LufUOhUc9sJjKPwe8YLh
	Azd62Ud6cg2lyeX1gJcQoMrSBCfrb4Tc0WrXf7/KGoHdBknpgiexOI27wFYxXZuhugv7avTmSjhay
	+t3l3e2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7O7-00000008iIj-32b3;
	Mon, 18 Aug 2025 21:27:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo64y-00000008aIM-1Jrd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 20:03:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dH2eYJg9ig+kSfW7cMBeMZJ9AnsCB9cbHi+mUKQa9Z0=; b=hs8B5dtDvDoy9PiX8/yBRs0OfJ
	O10xcJjPGFoJ8ZGxX/JYy+FUCLuK3ljT60oJiyFbEDCj3T4zyi4NeKcfEsI3W2X6+waANzHZ8FK3L
	Xwy6hcpF+CS5pLWUINjyMQRrLvCYI35itDGOfvtqrPJZGhNvxV/T3wC/lPBlL4o/f/M+F0UZOm3I5
	Hec3WhY8VYiEFwyQkNufTJptbxle669eSx3VCMvvOwisumeHuhG/1C4uh61J5WWq0M0TsRMADYZ8q
	kMMcQ4oOFz8bDFeaZzOXZOZ3PMrb0VjwL3flVH1YGXX3SVrjsqtGNetidoD50ZmwhZG6sHe+FVmSy
	+t2Z3Vog==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo64t-0000000HURL-1ng1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 20:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1755547382; bh=eh3xMCOXyKgUJnXSbekRaaERghl4/yYfIIqbXegEsNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gc9MgdMtwxpXDzaPzTZUlJ3RZkuXL0Ppvq+ZftY9pwlfXlNZwaOMoRyfCbMzIMmrB
	 w9PqQMryQLNz3T3nM4NvTduVyawi+c8amAPbl6QvnN56q2nwokuYxByqg3RITWdYk3
	 XLzWTwFpGHjSPqyMzjNuEP3YBLp6Kf1kMHLOBuWD3zCVSCmVQG1yBDP8miK27zacGS
	 gLGdfgKh5ReCiiByKueYyVEiBwL0oePIudMEHRo6VtGyD6sCOU9Y9Be9w5nat707jn
	 ICtepewfpNKao1W5lke1WvVw0C+fksnReLIroHfskqpvDkqRjVbjuoZBGxBp79u9Rv
	 qXHTcYhw/2kjQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 146333CDE9D;
	Mon, 18 Aug 2025 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1755547382; bh=eh3xMCOXyKgUJnXSbekRaaERghl4/yYfIIqbXegEsNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gc9MgdMtwxpXDzaPzTZUlJ3RZkuXL0Ppvq+ZftY9pwlfXlNZwaOMoRyfCbMzIMmrB
	 w9PqQMryQLNz3T3nM4NvTduVyawi+c8amAPbl6QvnN56q2nwokuYxByqg3RITWdYk3
	 XLzWTwFpGHjSPqyMzjNuEP3YBLp6Kf1kMHLOBuWD3zCVSCmVQG1yBDP8miK27zacGS
	 gLGdfgKh5ReCiiByKueYyVEiBwL0oePIudMEHRo6VtGyD6sCOU9Y9Be9w5nat707jn
	 ICtepewfpNKao1W5lke1WvVw0C+fksnReLIroHfskqpvDkqRjVbjuoZBGxBp79u9Rv
	 qXHTcYhw/2kjQ==
Message-ID: <ddcd3af2-534d-4708-9f7d-e301a91373ab@mleia.com>
Date: Mon, 18 Aug 2025 23:02:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to
 yaml format
To: Frank Li <Frank.Li@nxp.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250818183814.3603308-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250818183814.3603308-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250818_200302_104236_E7C5C42E 
X-CRM114-Status: UNSURE (   6.39  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_200302_104236_E7C5C42E 
X-CRM114-Status: UNSURE (   7.98  )
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

On 8/18/25 21:38, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> - add ref to matrix-keymap.yaml.
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

FWIW I'm fine, if this change enters over linux-input, otherwise I'll send it
in a PR to linux-arm-kernel/for-next.

-- 
Best wishes,
Vladimir

