Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3109CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLYLsBb0ONwXHUDdcmFlUMyOyjoSEmiNVpHJ/FyPVxM=; b=AInOzBIPx+1h/FZMTzkysFsgRK
	7DR8KbehzfeJF40IPFxMP3HdpRwy3vi8A/LIHZrtDjtjfukfWOEDzLZZoYP2EVutfS5RQFLR/Uxwc
	REly+5owiDN2pOYk96dLuQ09yncYm/fPhxYihbvNON0LmH/P386TX2rR0tYu8BSdPnmJ2gj6DqOR0
	hks4Q17KbKfsghXhrsq7/XuC85IuykKGD6Kodwi3mOLPfPcxCNpgr6lsjftp0EDkCIlE2lj8l2Wg+
	cCEqABa73NYIXEUhr0EGc2eZeuvtSzdmC8y8U4NYP6SDsmN03gBT4gO8lUbVR+GgKA+SqQYUzdFkD
	lLYpqoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4st-0000000BPUk-3KpY;
	Mon, 01 Jun 2026 15:48:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4sr-0000000BPUM-1JFf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:48:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA9CB40B84;
	Mon,  1 Jun 2026 15:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38CA1F00893;
	Mon,  1 Jun 2026 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780328936;
	bh=eLYLsBb0ONwXHUDdcmFlUMyOyjoSEmiNVpHJ/FyPVxM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=NECP3/zXoYK3LReSlsYz4ooKpK2nD/slHDnOEauFsl1dp0cnGLUjr2KviU0/1iYcf
	 4mYZ4YhVkFcwOd+mXk4T0azDsLoyFTQAI9sjMQ8/ItH+NXHoi4x/Oc5QmmFbVKkuf3
	 0Suh6cOnN9uHkDKOQpqYoMnwBifVyM4RrNKGg/pNPJvSskssbjES0SQg5W4pP2Kibr
	 +9sjXhTSnU3zfmZnqm2UyD1lYNdmu9vKaFNcvhVcYy2FiEcB+a6zm/deWOmB+iX19M
	 GiFjDdiigMlZ5B0aifU0iZx0lx5JiESjDADJqZ2Hi66N9IndK/10/38kij7W83cN1R
	 +otxfT1jkffXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 17:48:48 +0200
Message-Id: <DIXTXMSCSRPD.DKCTO34P6APU@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Petr Pavlu" <petr.pavlu@suse.com>,
 "Rahul Bukte" <rahul.bukte@sony.com>, <linux-kernel@vger.kernel.org>,
 <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Daniel Palmer" <daniel.palmer@sony.com>, "Tim
 Bird" <tim.bird@sony.com>, <linux-modules@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, "Sumit Gupta" <sumitg@nvidia.com>, "James
 Clark" <james.clark@linaro.org>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Daniel Gomez" <da.gomez@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>, "Aaron Tomlin"
 <atomlin@atomlin.com>, "Mike Leach" <mike.leach@arm.com>, "Leo Yan"
 <leo.yan@arm.com>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>
To: "Shashank Balaji" <shashank.mahadasyam@sony.com>, "Suzuki K Poulose"
 <suzuki.poulose@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6] kernel: param: initialize module_kset in a
 pure_initcall
References: <ahEd4iC-2hqUbMy3@JPC00244420>
 <20260601101942.4002661-1-shashank.mahadasyam@sony.com>
In-Reply-To: <20260601101942.4002661-1-shashank.mahadasyam@sony.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_084857_389072_721FE468 
X-CRM114-Status: UNSURE (   7.50  )
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

On Mon Jun 1, 2026 at 12:19 PM CEST, Shashank Balaji wrote:
> Danilo, I'm assuming this series goes through driver-core. Could you plea=
se
> pick up this version of this patch and the v5 of the others?

Yes, that's fine. It would be nice to have an ACK from Suzuki for the cores=
ight
changes though.

Suzuki, is this fine with you?

Also, for the future, please don't send new versions as a reply to previous
versions, bus as a new thread.

Thanks,
Danilo

