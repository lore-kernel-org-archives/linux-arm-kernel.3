Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B32B606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JCQwcGnz;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=jII/eFTh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l8rtHrapaottmx9goZkL6akyA4nq8Ox0o4KHJkDcn9s=; b=JCQwcGnzlm3KXU
	CSh/nqI80wML0UIdEPeu6cBGSQ9xw8+nGlXxNswPuZDLW9TOtbr2LenEfcTRPAiypkISEalq+CoTz
	ngWA6ISB5d+dncjpHvW8lg3xQlrE6n74GVk0e9NWV6M88ux9q1lciaK+7pWzNjrINkfOhzVYFe4ao
	yLzsDivROtB5Nh1M2zYn3rrg7cDSL2/7qYwaBqds19oKd2r7QiHA7hFT92YPXImqxKpGFIdNjY2/c
	iEi8na2qbFQ3+awWok4j76tSGn+jFdEk0tGmoOmlLyknEcbyq6CBwGYQAzyioUEeov/1bVxyUJyNT
	BKPVc1/OWFzPAo5SBOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLghy-00000004j6q-0PQe;
	Tue, 27 Oct 2026 12:55:18 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLghu-00000004j4h-2LYV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:55:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C792108A85;
	Tue, 27 Oct 2026 13:55:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793105704;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=l8rtHrapaottmx9goZkL6akyA4nq8Ox0o4KHJkDcn9s=;
	b=jII/eFThrQM6/pj3YkTAaPlhsi0wrkdNeuEsdMtU/Uat4y4xQGzuLa+oV6yo8SyFFP11Qj
	rlLHD0YtGXY+6YYcTI2jglyRB/O9aBS0RrvvMKSu2z8Xoofsf039UFWAhnK2DPhpAyXIy6
	nF0iKqVUtKzZKmdlBnJAqVa0jP93fkFwZqhXZdldyj+W2xSXLXGz1vGdNUn/H8xDw4UILp
	VhH6wBCTqb/2t+UmMZJjZ3zmRrCkFjzONguTGW8o+VcyH5A5wk3f4HIEZ4VbN2XMU3wyXq
	g5TVszijKlAw18o+ODALDahs0YQZOqRpGRBNoSA5D32e0PK++XkhuIA/7mqoYA==
Message-ID: <b87fb6cb-e9c4-46c7-9306-fce90cbee6e0@nabladev.com>
Date: Tue, 27 Oct 2026 13:31:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB
 number
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-kernel@vger.kernel.org
References: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
 <20261027111201.20936-2-cniedermaier@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261027111201.20936-2-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_055514_833702_D0A85C66 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/26 12:12 PM, Christoph Niedermaier wrote:
> The PCB number of the maveo box isn't 525. Change the
> number to the correct number, 625.
> 
> Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Reviewed-by: Marek Vasut <marex@nabladev.com>

