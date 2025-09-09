Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3E3CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 07:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkLVFVapCS9rw4tYTMr2CibTaZYukraHmu1rfU3DbGs=; b=4jHSLuYupGYkKtU2/8G6tcIr9L
	M/PiQgFCdLIzwoFP2H1MRUkymwWaTbET7QSKmAAJgF7Ox6CGl6kI3NhfCUN7FagYnlmUeM6ESEwei
	4bU2PzKQ5w3NGMesDtihC7mA4DY7JCafllcotZ1YRx66erEfXXDS8GrGhXGZE4X3Zb2tgvwynlhH6
	No0M/pruqi6fn+4I/EsTxDgOc3u+yn1PgPFMTU1cwpzz/vFAjDPT2wbAVwFyxo1Snc0s7fkhP4Kco
	3sRGk+EgS3ONJ5Z+l6hnnmV5nuZA6uW8gUgsG/HnxHzNbQ9dY+oP2jQKWGfkBYJb56yqb5G1yT3fc
	Er/7PGIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsLA-000000050oJ-1E3h;
	Tue, 09 Sep 2025 07:00:32 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvrB0-00000004UsK-2Rmv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 05:46:00 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 1F941A075D;
	Tue,  9 Sep 2025 07:45:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=LkLVFVapCS9rw4tYTMr2
	CibTaZYukraHmu1rfU3DbGs=; b=uUz7NHrnIBGmHpnIKXyOM4UxmmFh1Zqu9t1h
	yVIROpTaOy+PFq5XcYYX8S6My57dyRzoDaQz5I11Sf6PiXYfl/Vgm19GwxUxS9Di
	XX30dMJEY7bc1D62Q5ZwqqBu3t28TbjkkEbTavu4ufdGyeqdcVaGs2qg//mz6XMD
	s6kSKSlwG+nJoltHJ3wG17NUEVYHK3yq3LzAkLnUvCenk07Nknc7Rjz4kD+EDa5e
	miZQT2aNhxZBrL7LBD10iOUTDHqoolrV6qNkGVAfD8oAbLeDUiB4hWXd8LeaO7tn
	k8LIZknlVpswq6lOBXwlunn8ZxgM1uJsMi+sJ2bavoA3wPCDzve+rP/poyb6lOPo
	mPMifIfgeFFK3TFMq3p/nR/EFQmyBka3CH1t43icEJgIm3XxjqPrDBCsf3rI0OoA
	tjo0BQov2cUEx0ubZlmHyMQ9nLDvApq/thofET/rdmhIDAtv531FbVkJlZcBxJsR
	fCJST1vm21JIw1NHlT8fmB6z88JwtoHFQfN5kBqGFOYLn2Y3le9CWxFV69cD8ccN
	T9K1+Vgxp7S0XNncuAacseZnLqMRWCf0OC8dTtCAoBjUCP/tvBz+dcFh6GcogzAp
	kuW6n7gBwY1iibfT4UuZ7kfvTJF09Gz7SGOwDicACUZ9GBc+9Gq/o9VIe4kd3TqF
	HcQ24zo=
Message-ID: <e79a6234-73ad-48f3-a3f4-3b05f309737d@prolan.hu>
Date: Tue, 9 Sep 2025 07:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: imx6-cubox: Replace license text comment
 with SPDX identifier
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250812-cubox-dts-lic-v3-1-1eb7ef334934@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250812-cubox-dts-lic-v3-1-1eb7ef334934@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.6]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E627462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_224559_089129_06D48B46 
X-CRM114-Status: UNSURE (   8.61  )
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

Hi,

On 2025. 08. 12. 20:39, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

So, Russell, are you happy with how this patch looks now?

Bence


