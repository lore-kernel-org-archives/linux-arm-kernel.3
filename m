Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBF4F43849
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2iZyO9FYFHwVK9txvu6OevUWjqhizutDBTwII62EdQ=; b=EaBlnItMzHE+bzDOae/DCp2uui
	DOm58VSNLliulQkqJSapBOU4RPnMMl/pO3Y0K9IuSs4RLkpoiFSv/hldB3MfanOL+kHBPLtACZNt3
	/36UgViRR1+Ma7oEWsjF8IBYJXKoPFftNYSC5NZ6LPDPHY4HaWopuSpy8FtDxF6W5u8vnu0RRFswr
	7+3uvTVi7NF9rHAr3N++Zi4bZu21nvu54vWqwsfCswxilaEr3vKz6iA35VtqOLfBLzVABus4nliYr
	6xv0j747XLGXDybLNkqG+FZCEQaRejTRSXaXWP0SEacVl1NZR3yQXf0fcwalBNk9lDy9zMGUEeFQT
	G9yOllLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD2E8-00000001Kix-3Mj7;
	Wed, 15 Apr 2026 15:32:28 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD2E5-00000001Khd-3dF9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:32:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 2FE4BEC008D;
	Wed, 15 Apr 2026 11:32:22 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 15 Apr 2026 11:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776267142;
	 x=1776353542; bh=L2iZyO9FYFHwVK9txvu6OevUWjqhizutDBTwII62EdQ=; b=
	UfrTTa9Xvt/PyNy6bWhSA5M6IrYiOnF0V5u/2e1RkHXk5S2o+2uOrAl4lZsx1daQ
	q3pCHgLH4vmQMxPGK+OmrXZHF5WwrnWneLt0Vy9sN6+RPpT4qEzzVwZcA2OqdHg6
	rkG5aj3sQnFVDbfE4U3zy4ADeumb3pIMUE+RzJrXDIIr6/6usrm2AZqsL0offE/3
	6Kfch3F/99i8ziuWqZlDuwZMiKjzbqVUuf7Y5fV+NCnMtO9od6hQJF/Jq0IOtt8X
	6OYiV8EugrgiHOkAbmLXlIBRXs3CxmDtnadqOZWGNbpksEr5f5efyACLy2TpAN1E
	EunVjd/sBybtO0U7XVdVNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776267142; x=
	1776353542; bh=L2iZyO9FYFHwVK9txvu6OevUWjqhizutDBTwII62EdQ=; b=Q
	L3frsz21aRhOGMrd7xYj/uz0oF6TMLKzL4vV+yCrJaxH/DLVV5TkIJ7bkaxhhkFa
	vbGWSHgadU0D6UCib3O0La0qdCu4rnBBuhbLN8T1lZ0yGTsCLZLdWkQErIOlsp3O
	QQS4nyDwL7hTWlc7TeGTk2mk7XvRgMoYolZrMObxeH4MXAS53yvUJIX5epk8w0Cy
	HpG+8CC6xu6z88xqWu11mUsYIe17ZmsLT6vDOnUT7x7mhDNHxZAGQJDzzlcnmbCV
	4pqam87WyCoOgIhJsdWIBz04aj7BHpA7JTxSE1B7fjoWj3/rvHS/FZLo/9KJLF+P
	3A/wxvMc56iPE3nH4OTMg==
X-ME-Sender: <xms:ha_fafoy_6csYjNMF77Gf4i3z_fCpqMdJkteCUBNEv9-mTIyoUo_Zg>
    <xme:ha_faUckfHUw9DmAgORxwe58SMFfakZ97hiC5PxGSsVytU13e4Ax0PjewnQA675dz
    GD3AJOz5Ak2bhPI2Hr9vQqavjC16DgTdFo-WfubKfGbFGvr4qxseHo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeggeegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehsthgvfhgrnhdrfihivghhlhgvrhesnhhokhhi
    rgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:ha_fadN5BhZzgARvY_nYlf8Jmm_b9ij9PKgR8qf9keZ-N2rC14Vyug>
    <xmx:ha_faQHySoUjlg882U_kapzZ-7U8H6HBUQdwtf2hmtmLwm55NHZv7Q>
    <xmx:ha_faUP6FHsb0hULxURybR3x7f5J07_K5u2xXm1Olhtln19PgvjonA>
    <xmx:ha_faR-BuXP2bAKtWxQfQpp_VbEZnSCRd7hNh9r8AobdFl-qg5Q65g>
    <xmx:hq_faUUAAjFfDkoVbQYJBz1ze9ug9Y1Cu4BLE5S7wpPWmaXyn7UXctVQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AF2F4700065; Wed, 15 Apr 2026 11:32:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AeuX_cJPfcCo
Date: Wed, 15 Apr 2026 17:32:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stefan Wiehler" <stefan.wiehler@nokia.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <eb228f4d-8546-4de5-8858-4381ec142903@app.fastmail.com>
In-Reply-To: <64ceb81d-68e0-498c-bcf8-1ebb83ac2d23@nokia.com>
References: <8f104eba-6805-46e0-90da-232ce18973c5@nokia.com>
 <9ac3eb75-efac-4f3c-a3e9-6953db4babf8@app.fastmail.com>
 <f609436a-dd4a-43ac-9259-384d3695e709@nokia.com>
 <64ceb81d-68e0-498c-bcf8-1ebb83ac2d23@nokia.com>
Subject: Re: Highmem on AXM and K2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_083226_522157_BAAAAB41 
X-CRM114-Status: GOOD (  17.59  )
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

On Wed, Apr 15, 2026, at 16:48, Stefan Wiehler wrote:
> Hi Arnd,
>
> I would like to inform you that after some internal discussion, we
> decided not to continue with my experiments to transition from
> VMSPLIT_3G towards VMSPLIT_2G{_OPT} on the K2. The K2 is used in a
> legacy product after all, and the more senior colleagues were quite
> concerned about making such a major change due to various hacks that
> might fall apart along the way.
>
> Therefore, we will go the CIP path by staying with the last SLTS kernel
> with full highmem support. Therefore, we would be very glad if this is
> the case for at least the next SLTS kernel, supposedly to be released in
> 2027, as we should then be able (despite barely) to meet our projected
> EOL of 2037. 

Hi Stefan,

The CIP kernel from 2027 should certainly still support highmem,
though I am in the process of removing highmem usage from drivers
that rarely use a lot of memory, which means you may see a
slightly higher memory consumption, and changing the default to
CONFIG_VMSPLIT_2G_OPT/CONFIG_VMSPLIT_2G means that your configuration
will see less testing in the future.

I don't think there is an immediate problem for your product
using the 2027 LTS kernel, or (most likely) the 2029 version,
but I'm still worried about the boot regression you reported
with CONFIG_VMSPLIT_2G, which means we still have to make sure
K2 works with the new default.

      Arnd

