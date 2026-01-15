Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43858D44C41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wKvmCVsDgDYkKqu7ws+LeZod5rmDFhzLsuC5/UpM48=; b=TwP+tUPTnX/9sHTn9VRTfMXnte
	3SSTqFNPPXVqEkzsEiWB7A9wYKbU5NA6EXPznK6Uajz24ZHpvMFtadQNoFMXN3qNhB/UJGlbJlKPJ
	wEmA8tQFed29kza6sVxqyw9VEc6Sca76vK/aR3UcCIVObPLR3OS5WYfs6CSypeeRMcp/XT7Ej6RQg
	cux/sXuSxXx+JoM4hIm1ix+TU5B6IxDTkta2FLv/dbkxpCaCJUj28iOGsroqi/hFl9+SZC5ySTSjh
	ylys9KK0gvcW/vNbCsIGp50AU5RQpTOt1vawIy0fzVybhUs/GrswBRze84kzvu4LAjG41cK3WofIY
	rH2Ev9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNIu-0000000CPUh-0Taq;
	Thu, 15 Jan 2026 13:22:24 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNIr-0000000CPTu-3W7C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:22:23 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3F3CE691;
	Thu, 15 Jan 2026 14:22:09 +0100 (CET)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 14:22:08 +0100
Message-Id: <DFP70PIQL6YL.19MHNMOLO4FQD@kernel.org>
Subject: Re: [PATCH 0/2] Some minor fixes for the SMARC-sAM67 board
Cc: "Udit Kumar" <u-kumar1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260115131431.1521102-1-mwalle@kernel.org>
In-Reply-To: <20260115131431.1521102-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_052222_027423_D2F3C7E6 
X-CRM114-Status: UNSURE (   5.51  )
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

Borked the subject of the cover letter. It should have been:

arm64: dts: ti: sa67: some minor fixes for the SMARC-sAM67 board

-michael

