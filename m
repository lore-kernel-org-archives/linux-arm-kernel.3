Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D758C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJl6jij5cX4a+/CxoRlIkv2OzMELA/ibbpEJDYkPFso=; b=vPhiu9x4FYAAWI2pXIe9FYt/L/
	8IVoKWNwGyr+Yz0u1Ot45UeIsnoeflPTUyZGRIdpvQQm+37YmnzD1UbGvV8EBGVfVYXbQNiMn8wUZ
	grf3rZKRxI9rGC95FtSkHdQrMTsdMGPueUyajy53SKK/8gxju+m/u9wZe2+VCOIgLGhwrmsuK+bea
	T8SpwgZzxh7syAC3/pK8ZhH72MCjZ/UrT2LcP6RmOEIhskD9k0L3gbU2wVquSiyjLq7ABl9IPchKi
	lL1aHlAupVPvFZucNTAyQ7uoko4ZuyWrmvpwyFfNEXV1EoKLtA/iMC7ILtk2cmWY5c8l+3D1if2zM
	Z9fJjNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnOc-00000002HaS-3NHZ;
	Thu, 09 Jul 2026 11:58:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnOb-00000002Ha9-2HCj;
	Thu, 09 Jul 2026 11:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IJl6jij5cX4a+/CxoRlIkv2OzMELA/ibbpEJDYkPFso=; b=QDhKkA0P9KFHYGcxCLhbe8rLqC
	4lnCdULq+Anynjv/naiIvB7bJT5BtAwhyEt1HpDLen8u9WrN2smg6VqNsgKnfKFhHAxbq7KlWrUXN
	N6w6mq8aSDIpweabJz5nwfSynHuRVtizKtBrVVZvkcHOJFu6TOhiS6gGFzvvRR9+9SzlnSOyknnQ2
	LwKx9DcAfjA+w0Ic7JUPHDMawt+4lJXgaqHDQAEtRb9shF2NtJvLFwE++aWk5sPE3w7L+WMJZ2sXj
	1VIF8yqkRE5aVqWJD4zuURMAE8Y8T29okz5aCsCx4xYxPQhcPfU4NWu4v3PxqZmT7Z7roNA619G/q
	wG4Uj2rQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whnOT-00000009AvV-2gpW;
	Thu, 09 Jul 2026 11:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783598295;
	bh=0l8hKYZsEJCMBNL+X7+mtDqQz8nsijJQ7qlJBYs68jw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZDjPdkfSK69yVmIaEAk1+TJxeZr8mt+7OsHyjIIl6rYXJv89ODdh/Z/fyjs99nt48
	 EgJ2tCrQzWssQva7MvmvBfhnY22o3ASoF/lkc8XCza3wyxbJDCE2KEAttCXIeNr7AH
	 xQlVvlT4eFsXxZdtbQ3e+FucWTc0XjMTi5O+grXYz9Q8ea4Q4MrCvQtPf8U6VHI9Qh
	 QDyEzfGWZNgIUR7IqF/sCl8gxbbplLYyfNhdajB3mSrrwxhuv/vUuDtVlN9CWonlyk
	 NkG5x1h/e/R0ZFtXZffqJWlyZRnAjfYLQ5UGkXdwJ5JmjewOR+U9LvGbjJq84oGfOJ
	 GOi8azvVyfV1Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADF0D17E019E;
	Thu, 09 Jul 2026 13:58:14 +0200 (CEST)
Message-ID: <e8ba5a28-e06f-4351-ae71-ac0eca350916@collabora.com>
Date: Thu, 9 Jul 2026 13:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260625104742.113803-1-l.scorcia@gmail.com>
 <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud>
 <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
 <20260625-unearth-suffering-e2c59d39da0f@spud>
 <CAORyz2L5YuBifG-ud7QHPva+_nyL_SyXMVQ5EeC0s52isc5J3w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAORyz2L5YuBifG-ud7QHPva+_nyL_SyXMVQ5EeC0s52isc5J3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_125817_905421_E151E291 
X-CRM114-Status: GOOD (  12.37  )
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

On 6/26/26 11:12, Luca Leonardo Scorcia wrote:
>> Usually when making ABI changes because something was inaccurate (but
>> not wrong to the point that it didn't work at all) it's possible to
>> support both new and old ABIs at the same time because of new properties
>> etc. This is a difficult one because it's using the same properties in
>> different ways. A new compatible would definitely be required for a
>> genuine fresh start while retaining kernel support for the old mechanism
>> in this case.
> 
> All things considered, the cleanest solution seems to be adding a new
> compatible, mark the old one as deprecated and also try to fix the old
> driver code. I'll try to do that before submitting again.
> Thank you for your help!

You can skip the "fix the old driver code" part. The only users here are
demo boards that aren't even used that much and besides, they're even hard
to find.

Cheers,
Angelo

