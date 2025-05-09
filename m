Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DC6C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEgiNDVs1lRXQhChBrvDeI04SOmqtQdc7DQ4sxXU4hU=; b=l6y4ifsBX0zZ3o57vJ8nFu8yeQ
	UKWjs/lWyfl+6zE2QvlUIwTc8YgwDIwWtzAyeVQi5z4Kpp1fsLWjeEdgP2tMJBKbmT2Ehkeqfapwv
	99MI0VzXHhy5EPPugFrFayASQSiMyJCkwrYfDyAotbshurQbEvne9a32mf59ICQ2607gvq5wJ4jxE
	uASYy04l654OzV+6P15t6tCbf0eKI/vkNhMO9Rqvqd/AXtren1lQEx6Ap/MXLjRq3nhpHwQp0VcDE
	s4MAI+i+CIPW720WdVWwMb/JlMefm3y9D/RaLX32X9lL6LHSvre9rW/Bdway6ZX1dzjyShFjY39GI
	iUpfnF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU83-00000004jMM-0z28;
	Fri, 09 May 2025 20:15:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDP4w-00000003zmX-1B2P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:52:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A8285C6C7B;
	Fri,  9 May 2025 14:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A22C4CEF0;
	Fri,  9 May 2025 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746802317;
	bh=SQ3ST0q+wlQSTzpE963cNh46bGrba2SRAPHYEHnXIgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RwDYD33SjQ9aKUqfaVwft5DDadUpj0CiulF2fzFJ71vMWCAXZJ50kWMbId5ehqMfS
	 ctRpGO9Q5mUMWHICghU0Ww667FSEMKSkf6Cpf0bwtjKo58fvub7X5ueD2DluePLWVg
	 2fklH6LDRrCmfvUeMRdOXgJ5CnroMOOmVEsicY4g=
Date: Fri, 9 May 2025 16:50:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: serial: Convert
 socionext,milbeaut-usio-uart to DT schema
Message-ID: <2025050935-suffocate-snazzy-c5f3@gregkh>
References: <20250507154924.1602842-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507154924.1602842-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_075158_356849_3CA606FB 
X-CRM114-Status: GOOD (  11.63  )
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

On Wed, May 07, 2025 at 10:49:22AM -0500, Rob Herring (Arm) wrote:
> Convert the Socionext Milbeaut UART binding to DT schema. It is a
> straight-forward conversion.
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Fix $id path
> ---
>  .../bindings/serial/milbeaut-uart.txt         | 21 -------
>  .../serial/socionext,milbeaut-usio-uart.yaml  | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/milbeaut-uart.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/socionext,milbeaut-usio-uart.yaml

Are you wanting all of these serial "convert to dt schema" patches to go
through the tty/serial tree, or will you be taking them?  Either is fine
with me, your choice.

thanks,

greg k-h

