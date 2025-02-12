Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB54BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+8tJdrJUUM2r3rGlZ87tl2Cw8IhsamzxMOaFlEPj2Y=; b=mg2v5V8q/dcAmb
	J/jz0di4LpWkmCWnKKNXKlbfOwVHHbjkc5Xo0VP7X2ivoLyfV9U27Z9reGer5hlMZpAfAk8Nwkyx/
	Sk06fb7eH6o4CrNpLDEw0UtrsSmhtAd3S2Ek9W3kOkUFYI5su1qDe1IX6RQq/g8t6rTi6IIYZZule
	65pBVxJE1/I4kiI1H1+5GziO+I4gIvTyUXe1ol//TBBWUD8iQmsw/4vJszl5iAeH71X/MYXX/bVs9
	HH16s/IyPTHwspbva/9dn6y+pqaRXgj1C9pUVzHu9mGKP9PNvBDX4GpDoc47yyflis9tx7NiKmNpu
	7uFYXnJ+tnWLPknwfMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGIs-00000008Gka-2W2q;
	Wed, 12 Feb 2025 17:13:38 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiG6t-00000008Ce5-3aTg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:01:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8880441BB;
	Wed, 12 Feb 2025 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739379672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W+8tJdrJUUM2r3rGlZ87tl2Cw8IhsamzxMOaFlEPj2Y=;
	b=f7F4hpCdCR3z/FwoIu08EnVzGQ0zcm5AoyUNLuC30f4+TBNPiq8WyIpq85B1vQKH/a5Xuf
	Fjhp4ALHx/pNu2sNG4mKWmn2GEyxK9uyE/vwk4/i+0T+JkDnzXQdUu9bwC/EWH+lXssQ/e
	1mp0zcz1Rvx3noaAnvjJ0gmpsL2B2LAg127LkI8lQBuMDFvt8syI/kDxSCrkZSf4JOKpAw
	Ssuk13Roho2ghdOlELhoaaDvQtGONRC38PeY396QZGqvoA9Zi/WpFuZhYzk4WWROjAmSJ/
	2rcS7vXkRyb/wzK2rdI4RCps5R2rY5T43Zmz27JVh/urkh7J/yi7XOjX4x9UAg==
Message-ID: <a2702615-2946-4ca5-a33b-15da7026b58b@bootlin.com>
Date: Wed, 12 Feb 2025 18:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] bluetooth: hci_wilc: add wilc hci driver
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
 <20250212-wilc3000_bt-v1-10-9609b784874e@bootlin.com>
 <CABBYNZJ5XDasAfVxcFU+K=ru2PpZJVXkRuf_kokv1z66KF=Xaw@mail.gmail.com>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Language: en-US
In-Reply-To: <CABBYNZJ5XDasAfVxcFU+K=ru2PpZJVXkRuf_kokv1z66KF=Xaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdetteektdehudelheehkeeggfejgfelveevgeevtdejudfgveetgefhtdduuedtnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopeglkffrggeimedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdefpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhgtvghlsehhohhlthhmrghnnhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepk
 hhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrjhgrhidrkhgrthhhrghtsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepkhhvrghloheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_090116_503623_481EF85B 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Eric Dumazet <edumazet@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, Simon Horman <horms@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Luiz,
thanks for the prompt review !

On 2/12/25 17:14, Luiz Augusto von Dentz wrote:

[...]

>> +static int wilc_open(struct hci_uart *hu)
>> +{
>> +       struct wilc_data *wdata;
>> +
>> +       BT_DBG("hci_wilc: open");
> 
> Afaik you don't need to include the function name with the likes of
> pr_debug/BT_DBG, that said you should really be using bt_dev_dbg if
> you have hu->hdev set at this point, and this is valid for all other
> places where BT_DBG could be replaced with bt_dev_dbg.

I observe that BT_DBG does not bring any kind of prefix to the emitted log. But
indeed, bt_dev_dbg looks definitely better for my purpose, I'll update all those
logs with it.

>> +       wdata = kzalloc(sizeof(*wdata), GFP_KERNEL);
>> +       if (!wdata)
>> +               return -ENOMEM;
> 
> Add an empty after something like an if statement to make it clearer
> that it is not under the same scope.

True, that will be fixed.

[...]

> 
> Once you address these comments please fill free to add:
> 
> Reviewed-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Thanks. I'll delay v2 for a few days to let other people review the series.

Alexis

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

