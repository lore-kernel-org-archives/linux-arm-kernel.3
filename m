Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A7BF459E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4Zfbjm4MkkPRNcu/lkToxV+ObwGoSvmfiyPV7tjrN4=; b=GFossFmWs4z0zJUDl8ASfsK+wF
	2O4MhSZnz6x/sWQo0Pfx3EDjiiYOPYIzgZWOYskuePofZLJahfP0If8Bcr0Hjl4qjjtpG5P3SHBlA
	BQOK+Nhsbed+vMbU91MmjD05Q12Fc6AMau6aIHOTJa3BycQM5USN2DkDRxc3qKt6PiSyxrrKWmyJH
	QwfXMLpnnPMzXIgsxvIfu/LsAUWrk2Wqkan+Sqtq4bpjZrchtYUzn08T7jl9HD1HhBM7bLtaFjqRm
	XnTjHJjcXVcL394bUzCbTZMeUM56uYQU1zS3SEAf6UPZPNJ5VlWQS34O+tdVAGF987TqlRtKLUXxK
	A2dBQfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJIr-0000000Cove-1lZR;
	Fri, 10 Apr 2026 21:22:13 +0000
Received: from polaris.svanheule.net ([84.16.241.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJIo-0000000Cov5-1dwZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 21:22:12 +0000
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 805BB74665B;
	Fri, 10 Apr 2026 23:22:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1775856124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D4Zfbjm4MkkPRNcu/lkToxV+ObwGoSvmfiyPV7tjrN4=;
	b=bAkLb03z7VWjwwinayKy0UinK2NeeyXmLjxtVWLWzopQZe/CEqd7MO7MK4lvGQ8TTldQUk
	fcDYkSR6tAgJVvweYLghVtF4Xw99PvAsyR//i3bFXXikpARiUp74Y/f5mMn0ZGFBKIPCtb
	vLqVj7AzirgexJZSyP0MSHpn3+6rBsDF790y5JKogAgATvb8s8T9x0JtgySogkCbMZnz/V
	tsh8XX77wx7Fp82NJjy1u3yA+nZNhRphlQZZJ/d43GA0lin6qCQLIYE1tdQNO/ixtJTHnE
	tLuWWhZtiEo+6+q7y901DBqv7S5sIqlM/bhmuIhlit4jqRfuYOOxIhxS2jpv1g==
Message-ID: <a5e993d2b6c8b57d2057909812ce831877762bd6.camel@svanheule.net>
Subject: Re: [PATCH 3/4] pinctrl: vt8500: Enable compile testing
From: Sander Vanheule <sander@svanheule.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus
 Walleij	 <linusw@kernel.org>, Andreas =?ISO-8859-1?Q?F=E4rber?=
 <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Jeffery
	 <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Joel
 Stanley	 <joel@jms.id.au>, linux-realtek-soc@lists.infradead.org, James Tai
	 <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>
Date: Fri, 10 Apr 2026 23:22:03 +0200
In-Reply-To: <20260410-pinctrl-testing-v1-3-6f708c855867@oss.qualcomm.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
	 <20260410-pinctrl-testing-v1-3-6f708c855867@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_142210_705605_7E9446B1 
X-CRM114-Status: UNSURE (   4.94  )
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

Hi Krzysztof,

On Fri, 2026-04-10 at 15:04 +0200, Krzysztof Kozlowski wrote:
> Enable compile testing for Realtek pin controller drivers for increased

Small nit, but this looks like a copy-paste error from the other patch.

	Realtek -> VIA/Wondermedia (or vt8500, whatever you prefer)

Best,
Sander

